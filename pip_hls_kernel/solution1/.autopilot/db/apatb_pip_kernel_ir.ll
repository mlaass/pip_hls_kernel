; ModuleID = 'C:/Users/fpga/workspace/pip_hls_kernel/pip_hls_kernel/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<ap_uint<8>, 0>" = type { %"struct.ap_uint<8>" }
%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"class.std::ios_base::Init" }
%"class.std::ios_base::Init" = type { i8 }
%"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>" = type { %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>" }
%"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>" = type { %"struct.ap_fixed_base<18, 10, true, AP_RND, AP_SAT, 0>" }
%"struct.ap_fixed_base<18, 10, true, AP_RND, AP_SAT, 0>" = type { %"struct.ssdm_int<18, true>" }
%"struct.ssdm_int<18, true>" = type { i18 }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_pip_kernel_ir(%"class.hls::stream<ap_uint<8>, 0>"* noalias nocapture nonnull dereferenceable(1) %out, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias nocapture nonnull dereferenceable(4) %points, %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="128" %edges, i16 zeroext %strm_len) local_unnamed_addr #1 {
entry:
  %out_copy = alloca %"class.hls::stream<ap_uint<8>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<ap_uint<8>, 0>"* %out_copy, i32 0) ]
  %points_copy = alloca %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>", align 512
  call void @llvm.sideeffect() #9 [ "stream_interface"(%"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %points_copy, i32 0) ]
  %edges_copy = alloca [128 x i18], align 512
  %0 = bitcast %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"* %edges to [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]*
  call fastcc void @copy_in(%"class.hls::stream<ap_uint<8>, 0>"* nonnull %out, %"class.hls::stream<ap_uint<8>, 0>"* nonnull align 512 %out_copy, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* nonnull %points, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* nonnull align 512 %points_copy, [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* nonnull %0, [128 x i18]* nonnull align 512 %edges_copy)
  %1 = getelementptr [128 x i18], [128 x i18]* %edges_copy, i32 0, i32 0
  call void @apatb_pip_kernel_hw(%"class.hls::stream<ap_uint<8>, 0>"* %out_copy, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %points_copy, i18* %1, i16 %strm_len)
  call void @copy_back(%"class.hls::stream<ap_uint<8>, 0>"* %out, %"class.hls::stream<ap_uint<8>, 0>"* %out_copy, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %points, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %points_copy, [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %0, [128 x i18]* %edges_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<ap_uint<8>, 0>"* noalias, %"class.hls::stream<ap_uint<8>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* noalias readonly, [128 x i18]* noalias align 512) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<8>, 0>"(%"class.hls::stream<ap_uint<8>, 0>"* align 512 %1, %"class.hls::stream<ap_uint<8>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"(%"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* align 512 %3, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %2)
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"([128 x i18]* align 512 %5, [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %4)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<8>, 0>"(%"class.hls::stream<ap_uint<8>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<8>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<ap_uint<8>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<ap_uint<8>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_uint<8>, 0>"(%"class.hls::stream<ap_uint<8>, 0>"* nonnull align 512 %0, %"class.hls::stream<ap_uint<8>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_uint<8>, 0>"(%"class.hls::stream<ap_uint<8>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_uint<8>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<ap_uint<8>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<ap_uint<8>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<ap_uint<8>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<ap_uint<8>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<ap_uint<8>, 0>", %"class.hls::stream<ap_uint<8>, 0>"* %2
  %8 = bitcast %"class.hls::stream<ap_uint<8>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<ap_uint<8>, 0>"* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"(%"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = icmp eq %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %0, null
  %3 = icmp eq %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"(%"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* nonnull align 512 %0, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"(%"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>", %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %2
  %8 = bitcast %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a128struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"([128 x i18]* noalias align 512, [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* noalias readonly) unnamed_addr #5 {
entry:
  %2 = icmp eq [128 x i18]* %0, null
  %3 = icmp eq [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx7 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"], [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %1, i64 0, i64 %for.loop.idx7, i32 0, i32 0, i32 0
  %5 = getelementptr [128 x i18], [128 x i18]* %0, i64 0, i64 %for.loop.idx7
  %6 = bitcast i18* %src.addr.0.0.05 to i24*
  %7 = load i24, i24* %6
  %8 = trunc i24 %7 to i18
  store i18 %8, i18* %5, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx7, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<ap_uint<8>, 0>"* noalias, %"class.hls::stream<ap_uint<8>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* noalias, [128 x i18]* noalias readonly align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<8>, 0>"(%"class.hls::stream<ap_uint<8>, 0>"* %0, %"class.hls::stream<ap_uint<8>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"(%"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %2, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>.54"([128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %4, [128 x i18]* align 512 %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a128struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>.54"([128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* noalias, [128 x i18]* noalias readonly align 512) unnamed_addr #5 {
entry:
  %2 = icmp eq [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %0, null
  %3 = icmp eq [128 x i18]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx7 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %5 = getelementptr [128 x i18], [128 x i18]* %1, i64 0, i64 %for.loop.idx7
  %dst.addr.0.0.06 = getelementptr [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"], [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %0, i64 0, i64 %for.loop.idx7, i32 0, i32 0, i32 0
  %6 = bitcast i18* %5 to i24*
  %7 = load i24, i24* %6
  %8 = trunc i24 %7 to i18
  store i18 %8, i18* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx7, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

declare void @apatb_pip_kernel_hw(%"class.hls::stream<ap_uint<8>, 0>"*, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"*, i18*, i16)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<ap_uint<8>, 0>"* noalias, %"class.hls::stream<ap_uint<8>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* noalias, [128 x i18]* noalias readonly align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_uint<8>, 0>"(%"class.hls::stream<ap_uint<8>, 0>"* %0, %"class.hls::stream<ap_uint<8>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"(%"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %2, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* align 512 %3)
  ret void
}

define void @pip_kernel_hw_stub_wrapper(%"class.hls::stream<ap_uint<8>, 0>"*, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"*, i18*, i16) #7 {
entry:
  %4 = alloca [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]
  %5 = bitcast i18* %2 to [128 x i18]*
  call void @copy_out(%"class.hls::stream<ap_uint<8>, 0>"* null, %"class.hls::stream<ap_uint<8>, 0>"* %0, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* null, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %1, [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %4, [128 x i18]* %5)
  %6 = bitcast [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %4 to %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"*
  call void @pip_kernel_hw_stub(%"class.hls::stream<ap_uint<8>, 0>"* %0, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %1, %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"* %6, i16 %3)
  call void @copy_in(%"class.hls::stream<ap_uint<8>, 0>"* null, %"class.hls::stream<ap_uint<8>, 0>"* %0, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* null, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"* %1, [128 x %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"]* %4, [128 x i18]* %5)
  ret void
}

declare void @pip_kernel_hw_stub(%"class.hls::stream<ap_uint<8>, 0>"*, %"class.hls::stream<ap_fixed<18, 10, AP_RND, AP_SAT, 0>, 0>"*, %"struct.ap_fixed<18, 10, AP_RND, AP_SAT, 0>"*, i16)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="8" }
attributes #9 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="32" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
