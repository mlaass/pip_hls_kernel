#include "pip_kernel.h"

inline uint_t pip_crossing(fixed_t p_x, fixed_t p_y, fixed_t e1_x, fixed_t e1_y,
                           fixed_t e2_x, fixed_t e2_y)
{

  if (((e1_y <= p_y) && (e2_y > p_y)) || ((e1_y > p_y) && e2_y <= p_y))
  {
    // compute  the actual edge-ray intersect x-coordinate
    fixed_t vt = (p_y - e1_y) / (e2_y - e1_y);
    fixed_t ix = e1_x + (vt * (e2_x - e1_x));
    if (p_x < ix) // p_x < intersect x
      return 1;
  }
  return 0;
}

static fixed_t div_table[DIV_TABLE_SZ];

void init_div_table()
{
  int i;
  fixed_t start = -DIV_TABLE_SZ / 2;
LOOP_INIT_DIV_TABLE:
  for (i = 0; i < DIV_TABLE_SZ; i++)
  {
    fixed_t real_val = 1 / ((fixed_t)i + start);
    div_table[i] = real_val;
  }
}

inline fixed_t div_lookup(fixed_t b)
{
  return div_table[(int)b];
}

inline fixed_t fast_div(fixed_t a, fixed_t b)
{
  fixed_t one_div_b = div_lookup(b);
  return a * one_div_b;
}

uint_t pip_crossing2(fixed_t p_x, fixed_t p_y, fixed_t e1_x, fixed_t e1_y,
                     fixed_t e2_x, fixed_t e2_y)
{
  uint_t f1 = ((e1_y <= p_y) && (e2_y > p_y)) || ((e1_y > p_y) && e2_y <= p_y) ? 1 : 0;
  // compute  the actual edge-ray intersect x-coordinate
  // fixed_t vt = (p_y - e1_y) / (e2_y - e1_y);
  fixed_t vt = fast_div((p_y - e1_y), (e2_y - e1_y));
  fixed_t ix = e1_x + (vt * (e2_x - e1_x));
  uint_t f2 = (p_x < ix) ? 1 : 0; // p_x < intersect x
  return f1 & f2;
}

// inline uint_t pip_crossing3(fixed_t p_x, fixed_t p_y, fixed_t e1_x, fixed_t e1_y,
//                             fixed_t e2_x, fixed_t e2_y)
// {

//   uint_t f1 = ((e1_y <= p_y) && (e2_y > p_y)) || ((e1_y > p_y) && e2_y <= p_y) ? 1 : 0;
//   // compute  the actual edge-ray intersect x-coordinate
//   // fixed_t vt = (p_y - e1_y) / (e2_y - e1_y);
//   fixed_t vt = ((p_y - e1_y) / (e2_y - e1_y));
//   fixed_t ix = e1_x + (vt * (e2_x - e1_x));
//   uint_t f2 = (p_x < ix) ? 1 : 0; // p_x < intersect x
//   return f1 & f2;
// }
/*
void pip_kernel(uint_t out[N_POINTS], fixed_t points[POINT_ARR], fixed_t edgesA[EDGE_ARR], fixed_t edgesB[EDGE_ARR]) {
#pragma HLS DEPENDENCE true WAW intra variable=out
#pragma HLS SHARED variable=out
  init_div_table();
//#pragma HLS ARRAY_PARTITION variable=points dim=1 factor=40 block
//#pragma HLS ARRAY_PARTITION variable=edges dim=1 complete
  int i, j;

LOOP_I: for (i = 0; i < N_POINTS; i++) {
#pragma HLS PIPELINE II=1 rewind

  uint_t acc =0;
  fixed_t px, py;
  px =points[i * POINT_SIZE + 0];
  py=points[i * POINT_SIZE + 1];
  LOOP_J: for (j = 0; j < N_EDGES; j++) {
      acc += pip_crossing(px,py,
                       edgesA[j * EDGE_SIZE + 0], edgesA[j * EDGE_SIZE + 1],
                       edgesB[j * EDGE_SIZE + 0], edgesB[j * EDGE_SIZE + 1]);
    }
  out[i] = acc;
  }
}
*/
// inline uint_t pip_edges__(fixed_t px, fixed_t py, fixed_t edges_a[SZ_EDGES], fixed_t edges_b[SZ_EDGES])
// {
//   uint8_t j;
//   uint_t acc = 0;
// LOOP_PIP:
//   for (j = 0; j < N_EDGES; j++)
//   {
// #pragma HLS INLINE

//     fixed_t e1x = edges_a[j * 2 + 0];
//     fixed_t e1y = edges_a[j * 2 + 1];
//     fixed_t e2x = edges_b[j * 2 + 0];
//     fixed_t e2y = edges_b[j * 2 + 1];

//     acc += pip_crossing2(px, py, e1x, e1y, e2x, e2y);
//   }
//   return acc;
// }
inline uint_t pip_edges(fixed_t px, fixed_t py, fixed_t edges[SZ_EDGES])
{
  uint8_t j, i;
  uint_t res = 0;
  bool acc[SZ_EDGES] = {0};
LOOP_PIP:
  for (j = 0; j < N_EDGES; j++)
  {
//#pragma HLS loop_merge force
    fixed_t e1x = edges[j * 4 + 0];
    fixed_t e1y = edges[j * 4 + 1];
    fixed_t e2x = edges[j * 4 + 2];
    fixed_t e2y = edges[j * 4 + 3];

    acc[j] = pip_crossing2(px, py, e1x, e1y, e2x, e2y);
  }

LOOP_PIP_SUM:
  for (j = 0; j < N_EDGES; j++)
  {
#pragma HLS loop_merge force
    res += acc[i] ? 1 : 0;
  }
  return res;
}
// inline void pip_edges_out(hls::stream<uint_t> &out, fixed_t px, fixed_t py, fixed_t edges[SZ_EDGES])
// {
//   uint8_t j;
// // uint_t acc = 0;
// LOOP_PIP:
//   for (j = 0; j < N_EDGES; j++)
//   {

//     int k = (j + 1) % N_EDGES;
//     fixed_t e1x = edges[j * 4 + 0];
//     fixed_t e1y = edges[j * 4 + 1];
//     fixed_t e2x = edges[j * 4 + 2];
//     fixed_t e2y = edges[j * 4 + 3];

//     out << pip_crossing2(px, py, e1x, e1y, e2x, e2y);
//   }
//   // return acc;
// }

void pip_kernel(hls::stream<uint_t> &out, hls::stream<fixed_t> &points, fixed_t edges[SZ_EDGES], uint16_t strm_len = 64)
{
#pragma HLS INTERFACE mode=bram port=edges
  init_div_table();
//#pragma HLS ARRAY_PARTITION variable=points dim=1 factor=40 block
//#pragma HLS ARRAY_PARTITION variable=edges_b dim=1 factor=16 block

  int i;

LOOP_STREAM:
  for (i = 0; i < strm_len; i++)
  {
#pragma HLS LOOP_TRIPCOUNT avg = 4095 max = 65535 min = 63
    // ii = N_EDGES * 2*2*2 = 32 * 8 = 256
#pragma HLS PIPELINE II = 256 rewind
    fixed_t px, py;
    px = points.read();
    py = points.read();

    out << pip_edges(px, py, edges);
  }
}
