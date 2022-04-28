#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_out_V_cap_bc;
static AESL_RUNTIME_BC __xlx_out_V_size_Reader("../tv/stream_size/stream_size_out_out_V.dat");
unsigned int ap_apatb_points_V_cap_bc;
static AESL_RUNTIME_BC __xlx_points_V_size_Reader("../tv/stream_size/stream_size_in_points_V.dat");
struct __cosim_s1__ { char data[1]; };
struct __cosim_s4__ { char data[4]; };
extern "C" void pip_kernel(int*, __cosim_s1__*, __cosim_s4__*, int, int, short);
extern "C" void apatb_pip_kernel_hw(volatile void * __xlx_apatb_param_out, volatile void * __xlx_apatb_param_points, volatile void * __xlx_apatb_param_edges_a, volatile void * __xlx_apatb_param_edges_b, short __xlx_apatb_param_strm_len) {
  // Collect __xlx_edges_a_edges_b__tmp_vec
  vector<sc_bv<32> >__xlx_edges_a_edges_b__tmp_vec;
  for (int j = 0, e = 256; j != e; ++j) {
    __xlx_edges_a_edges_b__tmp_vec.push_back(((int*)__xlx_apatb_param_edges_a)[j]);
  }
  int __xlx_size_param_edges_a = 256;
  int __xlx_offset_param_edges_a = 0;
  int __xlx_offset_byte_param_edges_a = 0*4;
  for (int j = 0, e = 256; j != e; ++j) {
    __xlx_edges_a_edges_b__tmp_vec.push_back(((int*)__xlx_apatb_param_edges_b)[j]);
  }
  int __xlx_size_param_edges_b = 256;
  int __xlx_offset_param_edges_b = 256;
  int __xlx_offset_byte_param_edges_b = 256*4;
  int* __xlx_edges_a_edges_b__input_buffer= new int[__xlx_edges_a_edges_b__tmp_vec.size()];
  for (int i = 0; i < __xlx_edges_a_edges_b__tmp_vec.size(); ++i) {
    __xlx_edges_a_edges_b__input_buffer[i] = __xlx_edges_a_edges_b__tmp_vec[i].range(31, 0).to_uint64();
  }
  //Create input buffer for out
  ap_apatb_out_V_cap_bc = __xlx_out_V_size_Reader.read_size();
  __cosim_s1__* __xlx_out_input_buffer= new __cosim_s1__[ap_apatb_out_V_cap_bc];
  // collect __xlx_points_tmp_vec
  unsigned __xlx_points_V_tmp_Count = 0;
  unsigned __xlx_points_V_read_Size = __xlx_points_V_size_Reader.read_size();
  vector<__cosim_s4__> __xlx_points_tmp_vec;
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_points)->empty() && __xlx_points_V_tmp_Count < __xlx_points_V_read_Size) {
    __xlx_points_tmp_vec.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_points)->read());
    __xlx_points_V_tmp_Count++;
  }
  ap_apatb_points_V_cap_bc = __xlx_points_tmp_vec.size();
  // store input buffer
  __cosim_s4__* __xlx_points_input_buffer= new __cosim_s4__[__xlx_points_tmp_vec.size()];
  for (int i = 0; i < __xlx_points_tmp_vec.size(); ++i) {
    __xlx_points_input_buffer[i] = __xlx_points_tmp_vec[i];
  }
  // DUT call
  pip_kernel(__xlx_edges_a_edges_b__input_buffer, __xlx_out_input_buffer, __xlx_points_input_buffer, __xlx_offset_byte_param_edges_a, __xlx_offset_byte_param_edges_b, __xlx_apatb_param_strm_len);
// print __xlx_apatb_param_edges_a
  sc_bv<32>*__xlx_edges_a_output_buffer = new sc_bv<32>[__xlx_size_param_edges_a];
  for (int i = 0; i < __xlx_size_param_edges_a; ++i) {
    __xlx_edges_a_output_buffer[i] = __xlx_edges_a_edges_b__input_buffer[i+__xlx_offset_param_edges_a];
  }
  for (int i = 0; i < __xlx_size_param_edges_a; ++i) {
    ((int*)__xlx_apatb_param_edges_a)[i] = __xlx_edges_a_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_edges_b
  sc_bv<32>*__xlx_edges_b_output_buffer = new sc_bv<32>[__xlx_size_param_edges_b];
  for (int i = 0; i < __xlx_size_param_edges_b; ++i) {
    __xlx_edges_b_output_buffer[i] = __xlx_edges_a_edges_b__input_buffer[i+__xlx_offset_param_edges_b];
  }
  for (int i = 0; i < __xlx_size_param_edges_b; ++i) {
    ((int*)__xlx_apatb_param_edges_b)[i] = __xlx_edges_b_output_buffer[i].to_uint64();
  }
  for (unsigned i = 0; i <ap_apatb_out_V_cap_bc; ++i)
    ((hls::stream<__cosim_s1__>*)__xlx_apatb_param_out)->write(__xlx_out_input_buffer[i]);
}
