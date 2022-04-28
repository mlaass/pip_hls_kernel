// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XPIP_KERNEL_H
#define XPIP_KERNEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xpip_kernel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XPip_kernel_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XPip_kernel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPip_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPip_kernel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPip_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPip_kernel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XPip_kernel_Initialize(XPip_kernel *InstancePtr, u16 DeviceId);
XPip_kernel_Config* XPip_kernel_LookupConfig(u16 DeviceId);
int XPip_kernel_CfgInitialize(XPip_kernel *InstancePtr, XPip_kernel_Config *ConfigPtr);
#else
int XPip_kernel_Initialize(XPip_kernel *InstancePtr, const char* InstanceName);
int XPip_kernel_Release(XPip_kernel *InstancePtr);
#endif

void XPip_kernel_Start(XPip_kernel *InstancePtr);
u32 XPip_kernel_IsDone(XPip_kernel *InstancePtr);
u32 XPip_kernel_IsIdle(XPip_kernel *InstancePtr);
u32 XPip_kernel_IsReady(XPip_kernel *InstancePtr);
void XPip_kernel_Continue(XPip_kernel *InstancePtr);
void XPip_kernel_EnableAutoRestart(XPip_kernel *InstancePtr);
void XPip_kernel_DisableAutoRestart(XPip_kernel *InstancePtr);

void XPip_kernel_Set_edges_a(XPip_kernel *InstancePtr, u64 Data);
u64 XPip_kernel_Get_edges_a(XPip_kernel *InstancePtr);
void XPip_kernel_Set_edges_b(XPip_kernel *InstancePtr, u64 Data);
u64 XPip_kernel_Get_edges_b(XPip_kernel *InstancePtr);
void XPip_kernel_Set_strm_len(XPip_kernel *InstancePtr, u32 Data);
u32 XPip_kernel_Get_strm_len(XPip_kernel *InstancePtr);

void XPip_kernel_InterruptGlobalEnable(XPip_kernel *InstancePtr);
void XPip_kernel_InterruptGlobalDisable(XPip_kernel *InstancePtr);
void XPip_kernel_InterruptEnable(XPip_kernel *InstancePtr, u32 Mask);
void XPip_kernel_InterruptDisable(XPip_kernel *InstancePtr, u32 Mask);
void XPip_kernel_InterruptClear(XPip_kernel *InstancePtr, u32 Mask);
u32 XPip_kernel_InterruptGetEnabled(XPip_kernel *InstancePtr);
u32 XPip_kernel_InterruptGetStatus(XPip_kernel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
