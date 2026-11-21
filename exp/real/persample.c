/*
 * persample <records.bin>
 * For every record: the gzip size from a compressor without a session (stock's
 * bytes), and from a fresh session of each search that has been fed the same
 * record 40 times, so that its codes are as good for this record as shared
 * codes can be.  What is left of the difference is the search (and the
 * smoothing of the shared codes).  Prints: length stock codes fast ok
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "libdeflate.h"

static size_t session_size(const unsigned char *p, size_t n, int one_candidate, int *shared)
{
	struct libdeflate_compressor *c = libdeflate_alloc_compressor(1);
	struct libdeflate_decompressor *d = libdeflate_alloc_decompressor();
	size_t cap = libdeflate_gzip_compress_bound(c, n) + 64, out = 0, got;
	unsigned char *buf = malloc(cap), *back = malloc(n + 1);
	unsigned long long before;
	int i;

	libdeflate_set_session(c, 2);
	libdeflate_session_set_search(c, one_candidate);
	for (i = 0; i < 39; i++)
		libdeflate_gzip_compress(c, p, n, buf, cap);
	before = libdeflate_session_own_codes(c);
	out = libdeflate_gzip_compress(c, p, n, buf, cap);
	*shared = libdeflate_session_own_codes(c) == before;
	if (libdeflate_gzip_decompress(d, buf, out, back, n, &got) != LIBDEFLATE_SUCCESS ||
	    got != n || memcmp(back, p, n) != 0) {
		fprintf(stderr, "round trip failed\n");
		exit(1);
	}
	free(buf); free(back);
	libdeflate_free_compressor(c);
	libdeflate_free_decompressor(d);
	return out;
}

int main(int argc, char **argv)
{
	FILE *f = fopen(argv[1], "rb");
	struct libdeflate_compressor *plain = libdeflate_alloc_compressor(1);
	uint32_t n;

	if (!f) return 1;
	while (fread(&n, 4, 1, f) == 1) {
		unsigned char *p = malloc(n ? n : 1);
		size_t cap = libdeflate_gzip_compress_bound(plain, n) + 64;
		unsigned char *buf = malloc(cap);
		int s0, s1;
		size_t stock, codes, fast;

		if (fread(p, 1, n, f) != n) return 1;
		stock = libdeflate_gzip_compress(plain, p, n, buf, cap);
		codes = session_size(p, n, 0, &s0);
		fast = session_size(p, n, 1, &s1);
		printf("%u %zu %zu %zu %d %d\n", n, stock, codes, fast, s0, s1);
		free(p); free(buf);
	}
	return 0;
}
