/*
 * sstress.c - correctness of the session mode.
 * usage: sstress <corpus> <iters> <seed> [session=1] [calm=0]
 * calm=1: only inputs of 1-8 KiB that resemble each other, so that the session
 * is in use nearly all the time.
 * Feeds one level-1 compressor a long random sequence of inputs: fresh pieces
 * of the corpus, the previous input again, cut short, extended, with a byte or
 * a region changed, random bytes, runs.  Every output must gunzip to its input.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "libdeflate.h"

#ifdef SESS_STATS
extern unsigned long long libdeflate_sess_stats[8];
#endif

static unsigned long long rs;
static unsigned rnd(void)
{
	rs = rs * 6364136223846793005ULL + 1442695040888963407ULL;
	return (unsigned)(rs >> 33);
}

static size_t pick_len(void)
{
	switch (rnd() % 10) {
	case 0: return rnd() % 64;
	case 1: return 64 + rnd() % 448;
	case 2: case 3: return 512 + rnd() % 1536;
	case 4: case 5: case 6: return 2048 + rnd() % 6144;
	case 7: return 8192 + rnd() % 8192;
	case 8: return 16384 + rnd() % 8192;
	default: return rnd() % 70000;
	}
}

#define CAP 80000

int main(int argc, char **argv)
{
	FILE *f = fopen(argv[1], "rb");
	long iters = atol(argv[2]);
	int session = argc > 4 ? atoi(argv[4]) : 1;
	int calm = argc > 5 ? atoi(argv[5]) : 0;
	unsigned char *corpus, *cur = malloc(CAP), *prev = malloc(CAP), *back = malloc(CAP);
	size_t clen, plen = 0, bound, total_in = 0, total_out = 0, total_ref = 0;
	struct libdeflate_compressor *c = libdeflate_alloc_compressor(1);
	struct libdeflate_compressor *ref = libdeflate_alloc_compressor(1);
	struct libdeflate_decompressor *d = libdeflate_alloc_decompressor();
	unsigned char *out, *out2;

	rs = strtoull(argv[3], NULL, 0);
	fseek(f, 0, SEEK_END); clen = ftell(f); fseek(f, 0, SEEK_SET);
	corpus = malloc(clen);
	if (fread(corpus, 1, clen, f) != clen) return 2;
	bound = libdeflate_gzip_compress_bound(c, CAP);
	out = malloc(bound); out2 = malloc(bound);
	libdeflate_set_session(c, session);
	if (getenv("SS_ORDER")) libdeflate_session_set_order(c, atoi(getenv("SS_ORDER")));
	for (long it = 0; it < iters; it++) {
		size_t n = 0, got, back_n = 0, avail;
		unsigned mode = rnd() % 16;

		if (calm) {
			static const unsigned char m[16] = {0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 8, 9, 10, 10, 15, 4};

			mode = m[mode];
		}

		if (plen == 0 || mode < 4) {			/* a fresh piece */
			n = calm ? 1024 + rnd() % 7000 : pick_len();
			memcpy(cur, corpus + rnd() % (clen - n), n);
		} else if (mode < 8) {				/* same beginning, new end */
			size_t keep = rnd() % (plen + 1), add = rnd() % 3 || calm ? rnd() % 600 : pick_len();

			if (calm && keep + add > 8192) keep = 8192 - add;

			if (keep + add > CAP) add = CAP - keep;
			memcpy(cur, prev, keep);
			memcpy(cur + keep, corpus + rnd() % (clen - add), add);
			n = keep + add;
		} else if (mode == 8) {				/* again */
			memcpy(cur, prev, n = plen);
		} else if (mode == 9) {				/* cut short */
			memcpy(cur, prev, n = rnd() % (plen + 1));
		} else if (mode == 10) {			/* one byte changed */
			memcpy(cur, prev, n = plen);
			cur[rnd() % n] ^= 1 + rnd() % 255;
		} else if (mode == 11) {			/* a region replaced by noise */
			size_t a = rnd() % plen, l = rnd() % 200;

			memcpy(cur, prev, n = plen);
			for (size_t k = a; k < a + l && k < n; k++) cur[k] = rnd();
		} else if (mode == 12) {			/* noise */
			n = pick_len() % 20000;
			for (size_t k = 0; k < n; k++) cur[k] = rnd();
		} else if (mode == 13) {			/* a run, or a short period */
			unsigned per = 1 + rnd() % 7;

			n = pick_len() % 20000;
			for (size_t k = 0; k < n; k++) cur[k] = 'a' + k % per;
		} else if (mode == 14) {			/* bytes text never has, then the old input */
			size_t l = rnd() % 40;

			n = plen + l > CAP ? CAP : plen + l;
			for (size_t k = 0; k < l && k < n; k++) cur[k] = 128 + rnd() % 128;
			memcpy(cur + l, prev, n - l);
		} else {					/* the old input with a longer tail of itself */
			size_t l = rnd() % (plen + 1);

			if (calm) l %= 300;
			if (plen + l > CAP) l = CAP - plen;
			memcpy(cur, prev, plen);
			memcpy(cur + plen, prev, l);
			n = plen + l;
		}
		if (!calm && rnd() % 997 == 0) {
			session = !session;
			libdeflate_set_session(c, session);
		}
		/* Usually the bound; sometimes too little room, which must fail cleanly. */
		avail = rnd() % 50 ? libdeflate_gzip_compress_bound(c, n) : rnd() % (n / 2 + 20);
		memset(out, 0xA5, avail);
		got = libdeflate_gzip_compress(c, cur, n, out, avail);
		if (got == 0) {
			if (avail >= libdeflate_gzip_compress_bound(c, n)) {
				printf("FAIL it=%ld: no output with the bound available (n=%zu mode=%u)\n", it, n, mode);
				return 1;
			}
		} else {
			if (got > avail ||
			    libdeflate_gzip_decompress(d, out, got, back, CAP, &back_n) != LIBDEFLATE_SUCCESS ||
			    back_n != n || memcmp(back, cur, n) != 0) {
				printf("FAIL it=%ld: n=%zu mode=%u got=%zu back=%zu\n", it, n, mode, got, back_n);
				return 1;
			}
			total_in += n;
			total_out += got;
			total_ref += libdeflate_gzip_compress(ref, cur, n, out2, bound);
		}
		{ unsigned char *t = prev; prev = cur; cur = t; plen = n; }
	}
	printf("ok: %ld inputs, %zu bytes in, %zu out with the session, %zu without (%+.2f%%)\n",
	       iters, total_in, total_out, total_ref, (total_out / (double)total_ref - 1) * 100);
#ifdef SESS_STATS
	printf("    shared codes %llu, continued %llu (%llu bytes skipped), codes made %llu, own codes %llu, continue failed %llu\n",
	       libdeflate_sess_stats[0], libdeflate_sess_stats[1], libdeflate_sess_stats[5],
	       libdeflate_sess_stats[2], libdeflate_sess_stats[3], libdeflate_sess_stats[4]);
#endif
	return 0;
}
