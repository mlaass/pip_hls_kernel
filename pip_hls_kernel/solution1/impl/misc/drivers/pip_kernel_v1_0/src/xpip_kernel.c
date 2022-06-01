// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xpip_kernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPip_kernel_CfgInitialize(XPip_kernel *InstancePtr, XPip_kernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XPip_kernel_Start(XPip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XPip_kernel_IsDone(XPip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XPip_kernel_IsIdle(XPip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XPip_kernel_IsReady(XPip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XPip_kernel_Continue(XPip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XPip_kernel_EnableAutoRestart(XPip_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XPip_kernel_DisableAutoRestart(XPip_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XPip_kernel_Set_strm_len(XPip_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_STRM_LEN_DATA, Data);
}

u32 XPip_kernel_Get_strm_len(XPip_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_STRM_LEN_DATA);
    return Data;
}

void XPip_kernel_InterruptGlobalEnable(XPip_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_GIE, 1);
}

void XPip_kernel_InterruptGlobalDisable(XPip_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_GIE, 0);
}

void XPip_kernel_InterruptEnable(XPip_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_IER);
    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_IER, Register | Mask);
}

void XPip_kernel_InterruptDisable(XPip_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_IER);
    XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XPip_kernel_InterruptClear(XPip_kernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    //XPip_kernel_WriteReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_ISR, Mask);
}

u32 XPip_kernel_InterruptGetEnabled(XPip_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_IER);
}

u32 XPip_kernel_InterruptGetStatus(XPip_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    // Current Interrupt Clear Behavior is Clear on Read(COR).
    return XPip_kernel_ReadReg(InstancePtr->Control_BaseAddress, XPIP_KERNEL_CONTROL_ADDR_ISR);
}

