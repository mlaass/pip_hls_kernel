#ifndef PIP_HLS_KERNEL_HPP
#define PIP_HLS_KERNEL_HPP

#include <fstream>
#include <iostream>
using namespace std;

#include "ap_fixed.h"
#include "ap_int.h"
#include <hls_stream.h>
/*
#define N_POINTS 40
#define POINT_SIZE 2
// N_POINTS * POINT_SIZE
#define POINT_ARR 80
*/

//! WHEN changing this change ii value in LOOP_STREAM
#define N_EDGES 32
// N_EDGES*2
#define SZ_EDGES 64

#define DIV_TABLE_SZ 1024

typedef ap_fixed<18, 10, AP_RND, AP_SAT> fixed_t;
//typedef ap_int<18> fixed_t;

typedef ap_fixed<36, 18, AP_RND, AP_SAT> dfixed_t;

typedef ap_uint<8> uint_t;

//void pip_kernel(uint_t out[N_POINTS], fixed_t points[POINT_ARR], fixed_t edgesA[EDGE_ARR], fixed_t edgesB[EDGE_ARR]);

//void pip_kernel(hls::stream<uint_t> &out, hls::stream<fixed_t> & points, fixed_t edges_a[SZ_EDGES], fixed_t edges_b[SZ_EDGES], uint16_t strm_len);
void pip_kernel(hls::stream<uint_t> &out, hls::stream<fixed_t> & points, fixed_t edges[SZ_EDGES], uint16_t strm_len);

#endif
