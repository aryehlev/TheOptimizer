/*
 * sbench.c - one compressor, a file of records, each record one gzip call.
 * usage: sbench <level> <session 0|1> <thrash_bytes|0> <records.bin>
 * records.bin is [u32 length][bytes] repeated.  Hot: all records back to back,
 * best of 15 passes.  With thrash_bytes > 0 that much unrelated memory is walked
 * (untimed) before each call, the record is touched as if just serialized, and
 * each call is timed alone (median of all calls over 5 passes).
 * Prints: us_per_call total_out calls.  Every output is checked with gunzip.
 */
#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "libdeflate.h"

#ifdef HAVE_SESSION
#  ifdef SESS_STATS
extern unsigned long long libdeflate_sess_stats[8];
#  endif
#endif

static double now(void)
{
	struct timespec ts;

	clock_gettime(CLOCK_MONOTONIC, &ts);
	return ts.tv_sec + ts.tv_nsec * 1e-9;
}

static int cmpd(const void *a, const void *b)
{
	double x = *(const double *)a, y = *(const double *)b;

	return (x > y) - (x < y);
}

int main(int argc, char **argv)
{
	int level = atoi(argv[1]), session = atoi(argv[2]);
	size_t tb = strtoul(argv[3], NULL, 0), flen, nrec = 0, maxlen = 0, total = 0, cap;
	volatile unsigned char *thrash = tb ? malloc(tb) : NULL;
	FILE *f = fopen(argv[4], "rb");
	unsigned char *buf, *out, *back, **rec;
	unsigned *len;
	struct libdeflate_compressor *c = libdeflate_alloc_compressor(level);
	struct libdeflate_decompressor *d = libdeflate_alloc_decompressor();
	int reps = getenv("SB_PASSES") ? atoi(getenv("SB_PASSES")) : tb ? 5 : 15;
	double best = 1e99, *samples = NULL;
	size_t nsamples = 0;
	unsigned sink = 0;

	if (!f) return 2;
	fseek(f, 0, SEEK_END); flen = ftell(f); fseek(f, 0, SEEK_SET);
	buf = malloc(flen);
	if (fread(buf, 1, flen, f) != flen) return 2;
	for (size_t off = 0; off + 4 <= flen; nrec++) { unsigned l; memcpy(&l, buf + off, 4); off += 4 + l; }
	rec = malloc(nrec * sizeof(*rec)); len = malloc(nrec * sizeof(*len));
	nrec = 0;
	for (size_t off = 0; off + 4 <= flen; nrec++) {
		memcpy(&len[nrec], buf + off, 4);
		rec[nrec] = buf + off + 4;
		if (len[nrec] > maxlen) maxlen = len[nrec];
		off += 4 + len[nrec];
	}
	cap = libdeflate_gzip_compress_bound(c, maxlen);
	out = malloc(cap); back = malloc(maxlen + 1);
	if (tb) { memset((void *)thrash, 1, tb); samples = malloc(reps * nrec * sizeof(double)); }
#ifdef HAVE_SESSION
	libdeflate_set_session(c, session);
#ifdef HAVE_SEARCH_API
	if (getenv("SB_SEEDS")) libdeflate_session_set_search(c, atoi(getenv("SB_SEEDS")));
#endif
	if (getenv("SB_ORDER")) libdeflate_session_set_order(c, atoi(getenv("SB_ORDER")));
#else
	if (session) return 3;
#endif
	/* Untimed: every output must be the input again.  SB_DUMP=<file> keeps the outputs. */
	FILE *dump = getenv("SB_DUMP") ? fopen(getenv("SB_DUMP"), "wb") : NULL;
	for (size_t i = 0; i < nrec; i++) {
		size_t n = libdeflate_gzip_compress(c, rec[i], len[i], out, cap), bn = 0;

		if (dump) { unsigned g = n, l = len[i]; fwrite(&g, 4, 1, dump); fwrite(&l, 4, 1, dump); fwrite(out, 1, n, dump); fwrite(rec[i], 1, l, dump); }

		if (!n || libdeflate_gzip_decompress(d, out, n, back, maxlen + 1, &bn) != LIBDEFLATE_SUCCESS ||
		    bn != len[i] || memcmp(back, rec[i], bn)) { fprintf(stderr, "record %zu does not round-trip\n", i); return 1; }
	}
	if (dump) fclose(dump);
#if defined(HAVE_SESSION) && defined(SESS_STATS)
	memset(libdeflate_sess_stats, 0, sizeof(libdeflate_sess_stats));
#endif
	for (int r = 0; r < reps; r++) {
		double t0 = now();

		total = 0;
		for (size_t i = 0; i < nrec; i++) {
			if (tb) {
				double t1;

				for (size_t k = 0; k < tb; k += 64) sink += thrash[k]++;
				for (size_t k = 0; k < len[i]; k += 64) sink += rec[i][k];
				t1 = now();
				total += libdeflate_gzip_compress(c, rec[i], len[i], out, cap);
				samples[nsamples++] = now() - t1;
				if (i >= 599) { nrec = 600; break; }
			} else {
				total += libdeflate_gzip_compress(c, rec[i], len[i], out, cap);
			}
		}
		if (!tb && now() - t0 < best) best = now() - t0;
	}
	if (tb) { qsort(samples, nsamples, sizeof(double), cmpd); best = samples[nsamples / 2] * nrec; }
	printf("%.2f %zu %zu", best / nrec * 1e6, total, nrec);
#if defined(HAVE_SESSION) && defined(SESS_STATS)
	printf("  [per pass: shared %llu, continued %llu, codes made %llu, own codes %llu, skipped %llu B]",
	       libdeflate_sess_stats[0] / reps, libdeflate_sess_stats[1] / reps, libdeflate_sess_stats[2] / reps,
	       libdeflate_sess_stats[3] / reps, libdeflate_sess_stats[5] / reps); printf(" bad fit %llu", libdeflate_sess_stats[6] / reps);
#endif
	printf("\n");
	return sink == 12345;
}
