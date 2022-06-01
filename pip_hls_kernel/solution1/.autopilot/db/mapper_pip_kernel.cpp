#include <systemc>
#include <list>
#include <map>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;

namespace bcsim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(1<<10)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
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
unsigned int ap_apatb_out_r_cap_bc;
static AESL_RUNTIME_BC __xlx_out_r_V_size_Reader("../tv/stream_size/stream_size_out_out_r.dat");
unsigned int ap_apatb_points_cap_bc;
static AESL_RUNTIME_BC __xlx_points_V_size_Reader("../tv/stream_size/stream_size_in_points.dat");
struct __cosim_s1__ { char data[1]; };
struct __cosim_s4__ { char data[4]; };
extern "C" void pip_kernel(__cosim_s1__*, __cosim_s4__*, int*, short);
extern "C" void apatb_pip_kernel_hw(volatile void * __xlx_apatb_param_out_r, volatile void * __xlx_apatb_param_points, volatile void * __xlx_apatb_param_edges, short __xlx_apatb_param_strm_len) {
  //Create input buffer for out_r
  ap_apatb_out_r_cap_bc = __xlx_out_r_V_size_Reader.read_size();
  __cosim_s1__* __xlx_out_r_input_buffer= new __cosim_s1__[ap_apatb_out_r_cap_bc];
auto* sout_r = bcsim::createStream((hls::stream<__cosim_s1__>*)__xlx_apatb_param_out_r);
auto* spoints = bcsim::createStream((hls::stream<__cosim_s4__>*)__xlx_apatb_param_points);
  // Collect __xlx_edges__tmp_vec
  vector<sc_bv<18> >__xlx_edges__tmp_vec;
  for (int j = 0, e = 128; j != e; ++j) {
    sc_bv<18> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_edges)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_edges)[j*4+1];
    _xlx_tmp_sc.range(17, 16) = ((char*)__xlx_apatb_param_edges)[j*4+2];
    __xlx_edges__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_edges = 128;
  int __xlx_offset_param_edges = 0;
  int __xlx_offset_byte_param_edges = 0*4;
  int* __xlx_edges__input_buffer= new int[__xlx_edges__tmp_vec.size()];
  for (int i = 0; i < __xlx_edges__tmp_vec.size(); ++i) {
    __xlx_edges__input_buffer[i] = __xlx_edges__tmp_vec[i].range(17, 0).to_uint64();
  }
  // DUT call
  pip_kernel(sout_r->data<__cosim_s1__>(), spoints->data<__cosim_s4__>(), __xlx_edges__input_buffer, __xlx_apatb_param_strm_len);
sout_r->transfer((hls::stream<__cosim_s1__>*)__xlx_apatb_param_out_r);
spoints->transfer((hls::stream<__cosim_s4__>*)__xlx_apatb_param_points);
// print __xlx_apatb_param_edges
  sc_bv<18>*__xlx_edges_output_buffer = new sc_bv<18>[__xlx_size_param_edges];
  for (int i = 0; i < __xlx_size_param_edges; ++i) {
    __xlx_edges_output_buffer[i] = __xlx_edges__input_buffer[i+__xlx_offset_param_edges];
  }
  for (int i = 0; i < __xlx_size_param_edges; ++i) {
    ((char*)__xlx_apatb_param_edges)[i*4+0] = __xlx_edges_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_edges)[i*4+1] = __xlx_edges_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_edges)[i*4+2] = __xlx_edges_output_buffer[i].range(17, 16).to_uint();
  }
}
