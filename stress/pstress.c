/*
 * pstress.c - sessions: random sequences of inputs through level 1 compressors
 * that share codes, with every table order and with output buffers of every
 * kind.
 * usage: pstress <records.bin> <iterations> <seed> [dump_file]
 * PS_CALM=1: only records (whole, cut short, or the same again), so that most
 * inputs are written in one pass.
 * records.bin is [u32 len][bytes] repeated.  Every output is decompressed and
 * compared; every 40th goes to dump_file as [u32 gz_len][u32 len][gz][input].
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "libdeflate.h"

#ifdef SESS_STATS
extern unsigned long long libdeflate_sess_stats[8];
#endif
static uint64_t rs;
static uint64_t rnd(void) { rs ^= rs >> 12; rs ^= rs << 25; rs ^= rs >> 27; return rs * 0x2545F4914F6CDD1DULL; }
static size_t below(size_t n) { return n ? rnd() % n : 0; }

#define MAXIN 20000

int main(int argc, char **argv)
{
	FILE *f = fopen(argv[1], "rb"), *dump = argc > 4 ? fopen(argv[4], "wb") : NULL;
	long iters = atol(argv[2]);
	size_t flen, nrec = 0, off, n = 0, prev_n = 0;
	unsigned char *buf, **rec, *in = malloc(MAXIN + 600), *prev = malloc(MAXIN + 600), *back = malloc(MAXIN + 600);
	unsigned *len;
	struct libdeflate_compressor *a = NULL, *b = NULL;
	struct libdeflate_decompressor *d = libdeflate_alloc_decompressor();
	unsigned long long n_frozen = 0, n_copy = 0, n_big = 0, n_exact = 0, n_small = 0, own = 0, bytes_in = 0, bytes_out = 0;

	rs = strtoull(argv[3], NULL, 0) * 0x9E3779B97F4A7C15ULL + 1;
	if (!f) return 2;
	fseek(f, 0, SEEK_END); flen = ftell(f); fseek(f, 0, SEEK_SET);
	buf = malloc(flen);
	if (fread(buf, 1, flen, f) != flen) return 2;
	for (off = 0; off + 4 <= flen; nrec++) { unsigned l; memcpy(&l, buf + off, 4); off += 4 + l; }
	rec = malloc(nrec * sizeof(*rec)); len = malloc(nrec * sizeof(*len));
	for (off = 0, nrec = 0; off + 4 <= flen; nrec++) { memcpy(&len[nrec], buf + off, 4); rec[nrec] = buf + off + 4; off += 4 + len[nrec]; }

	for (long it = 0; it < iters; it++) {
		struct libdeflate_compressor *c;
		size_t cap, got, bn = 0, k;
		unsigned char *out;
		int kind;

		if (a == NULL || below(250) == 0) {
			size_t train = 1 + below(below(4) ? 60 : 3);

			if (a) own += libdeflate_session_own_codes(a);
			if (b) own += libdeflate_session_own_codes(b);
			libdeflate_free_compressor(a); libdeflate_free_compressor(b);
			a = libdeflate_alloc_compressor(1); b = NULL;
			libdeflate_set_session(a, 1 + (int)below(2));
			libdeflate_session_set_order(a, 11 + (int)below(6));	/* 12 to 15; out of range is clamped */
			out = malloc(libdeflate_gzip_compress_bound(a, MAXIN));
			for (k = 0; k < train; k++) {
				size_t r = below(nrec);

				if (!libdeflate_gzip_compress(a, rec[r], len[r] > MAXIN ? MAXIN : len[r], out, libdeflate_gzip_compress_bound(a, MAXIN))) return 1;
			}
			free(out);
			if (below(3)) {
				/* a second session of its own, fed every other input or so */
				b = libdeflate_alloc_compressor(1);
				libdeflate_set_session(b, 1 + (int)below(2));
				libdeflate_session_set_order(b, 12 + (int)below(4));
				n_copy++;
			}
			n_frozen++;
			prev_n = 0;
		}
		c = (b && below(2)) ? b : a;

		kind = (int)below(16);
		if (getenv("PS_CALM")) kind = "\0\4\5\5\6\7\10\10"[below(8)];	/* records, whole, cut or again: mostly one pass */
		if (kind == 0 && prev_n) {			/* the same again */
			memcpy(in, prev, n = prev_n);
		} else if (kind == 1 && prev_n > 8) {		/* the same beginning, another end */
			size_t keep = 1 + below(prev_n - 1), l = below(3000);

			memcpy(in, prev, keep);
			for (k = 0; k < l && keep + k < MAXIN; k++) { size_t r = below(nrec); in[keep + k] = rec[r][below(len[r])]; }
			n = keep + k;
		} else if (kind == 2) {				/* tiny */
			size_t r = below(nrec);

			n = below(70); if (n > len[r]) n = len[r];
			memcpy(in, rec[r], n);
		} else {
			/* a record, or pieces: text, tokens, any bytes, runs */
			n = 0;
			if (kind < 9) {
				size_t r = below(nrec);

				n = len[r] > MAXIN ? MAXIN : len[r];
				memcpy(in, rec[r], n);
				if (kind == 3) for (k = 0; k < 1 + below(20) && n; k++) in[below(n)] ^= 1 << below(8);	/* changed bytes */
				if (kind == 4 && n > 100) n -= below(n - 50);							/* cut short */
			}
			while (kind >= 9 && n < 64 + below(kind == 9 ? MAXIN : 6000) && n < MAXIN) {
				size_t r = below(nrec), o = below(len[r]), l = 1 + below(kind < 11 ? 4000 : 400), w = below(10);

				if (o + l > len[r]) l = len[r] - o;
				if (n + l > MAXIN) l = MAXIN - n;
				if (w == 0 && kind == 15) { for (k = 0; k < l && k < 300; k++) in[n + k] = (unsigned char)rnd(); l = k; }	/* any bytes */
				else if (w <= 2) { for (k = 0; k < l && k < 700; k++) in[n + k] = "0123456789abcdef-ABCDEFGHIJKLMNOPQRSTUVWXYZ_ghijklmnopqrstuvwxyz+/="[below(w == 1 ? 67 : 16)]; l = k; }
				else if (w == 3) memset(in + n, 'a' + (int)below(3), l);
				else memcpy(in + n, rec[r] + o, l);
				n += l;
			}
		}
		memcpy(prev, in, prev_n = n);

		cap = libdeflate_gzip_compress_bound(c, n);
		if (below(3) == 0) { cap = 2 * n + 700 + below(2000); n_big++; }	/* room for one pass to write in place */
		out = malloc(cap);
		got = libdeflate_gzip_compress(c, in, n, out, cap);
		if (!got || libdeflate_gzip_decompress(d, out, got, back, MAXIN + 600, &bn) != LIBDEFLATE_SUCCESS || bn != n || memcmp(back, in, n)) {
			fprintf(stderr, "iteration %ld: output is wrong (n=%zu, got=%zu)\n", it, n, got); return 1;
		}
		bytes_in += n; bytes_out += got;
		if (dump && it % 40 == 0) { unsigned g = got, l = n; fwrite(&g, 4, 1, dump); fwrite(&l, 4, 1, dump); fwrite(out, 1, got, dump); fwrite(in, 1, n, dump); }
		if (below(4) == 0) {
			/* A buffer of exactly the size that was needed, then one that is too small. */
			unsigned char *ex = malloc(got);
			size_t g2 = libdeflate_gzip_compress(c, in, n, ex, got);

			n_exact++;
			if (g2 && (g2 > got || libdeflate_gzip_decompress(d, ex, g2, back, MAXIN + 600, &bn) != LIBDEFLATE_SUCCESS || bn != n || memcmp(back, in, n))) {
				fprintf(stderr, "iteration %ld: exact-size output is wrong\n", it); return 1;
			}
			free(ex);
			if (got > 19) {
				size_t sm = got - 1 - below(got < 200 ? got - 19 : 180);

				ex = malloc(sm);
				g2 = libdeflate_gzip_compress(c, in, n, ex, sm);
				n_small++;
				if (g2 && (g2 > sm || libdeflate_gzip_decompress(d, ex, g2, back, MAXIN + 600, &bn) != LIBDEFLATE_SUCCESS || bn != n || memcmp(back, in, n))) {
					fprintf(stderr, "iteration %ld: small-buffer output is wrong\n", it); return 1;
				}
				free(ex);
			}
		}
		free(out);
	}
	if (a) own += libdeflate_session_own_codes(a);
	if (b) own += libdeflate_session_own_codes(b);
	printf("ok: %ld inputs, %llu bytes in, %llu out; %llu sessions and %llu second ones; %llu large, %llu exact-size and %llu too-small buffers; %llu inputs with codes of their own\n",
	       iters, bytes_in, bytes_out, n_frozen, n_copy, n_big, n_exact, n_small, own);
#ifdef SESS_STATS
	printf("    in one pass %llu, two passes with shared codes %llu, continued %llu, codes made %llu\n",
	       libdeflate_sess_stats[7], libdeflate_sess_stats[0], libdeflate_sess_stats[1], libdeflate_sess_stats[2]);
#endif
	return 0;
}
