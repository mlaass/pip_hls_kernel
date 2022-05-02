#include "pip_kernel.h"

void make_test_res(fixed_t *points, bool *res, int points_len = 1024) {

  for (int i = 0; i < points_len; i++) {
    fixed_t px = points[i * 2];
    fixed_t py = points[i * 2 + 1];

    res[i] = (px >= 60) && (px < 120) && (py >= 60) && (py < 120);
  }
}

int main() {

  fixed_t points[2048];
  for (int i = 0; i < 2048; i++) {
    if (i % 2 == 0)
      points[i] = (float)(rand() % 360);
    else
      points[i] = (float)(rand() % 180);
  }
  bool results[1024];
  make_test_res(points, results, 1024);

  fixed_t edges_a[SZ_EDGES], edges_b[SZ_EDGES];

  for (int i = 0; i < SZ_EDGES; i++) {
    edges_a[i] = -1;
    edges_b[i] = -1;
  }
  edges_a[0] = 60;
  edges_a[1] = 60;
  // edges_b[0] = 120;
  // edges_b[1] = 60;

  edges_a[2] = 120;
  edges_a[3] = 60;
  // edges_b[2] = 120;
  // edges_b[3] = 120;

  edges_a[4] = 120;
  edges_a[5] = 120;
  // edges_b[4] = 60;
  // edges_b[5] = 120;

  edges_a[6] = 60;
  edges_a[7] = 120;
  // edges_b[6] = 60;
  // edges_b[7] = 60;

  hls::stream<fixed_t> pt_stream("pt_stream");
  hls::stream<uint_t> out_strm("out_strm");
  for(int i = 0; i < 1024; i++){
	  pt_stream.write(points[i*2]);
	  pt_stream.write(points[(i*2) +1]);

  }
  pip_kernel(out_strm, pt_stream, edges_a, 1024);
  int err_cnt = 0;
  for (int i = 0; i < 1024; i++) {
    uint_t val = out_strm.read();
    bool ref_val = results[i];
    if ((val % 2 == 0) && ref_val) {
      err_cnt++;
      cout << "!!! ERROR: Mismatch detected at " << i << endl;
    }
  }

  int ret_val = 0;
  if (err_cnt == 0) {
    cout << "*** TEST PASSED ***" << endl;
  } else {
    cout << "!!! TEST FAILED - " << err_cnt << " mismatches detected !!!";
    cout << endl;
    ret_val = -1;
  }

  return ret_val;
}
