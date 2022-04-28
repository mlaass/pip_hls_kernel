// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xpip_kernel.h"

extern XPip_kernel_Config XPip_kernel_ConfigTable[];

XPip_kernel_Config *XPip_kernel_LookupConfig(u16 DeviceId) {
	XPip_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XPIP_KERNEL_NUM_INSTANCES; Index++) {
		if (XPip_kernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XPip_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XPip_kernel_Initialize(XPip_kernel *InstancePtr, u16 DeviceId) {
	XPip_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XPip_kernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XPip_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

