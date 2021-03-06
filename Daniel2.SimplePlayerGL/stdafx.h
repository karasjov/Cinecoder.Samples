// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#include <algorithm>    // std::max / std::min
#include <string>
#include <cassert>
#include <list>
#include <vector>
#include <queue>
#include <memory>
#include <fstream>

///////////////////////////////////////////////////////////////////////////////

// Cinegy utils
#include "utils/HMTSTDUtil.h"
using namespace cinegy::threading_std;

///////////////////////////////////////////////////////////////////////////////

#if defined(_WIN32)
	#if !defined(__WIN32__)
		#define __WIN32__
	#endif
#endif

#if defined(__linux__) || defined(__LINUX__)
	#if !defined(__LINUX__)
		#define __LINUX__
	#endif
#endif

#if defined(__WIN32__) // for ConvertStringToBSTR
	#include <comutil.h>
	#pragma comment(lib, "comsuppw.lib")
#endif

#if defined(__WIN32__) || defined(__LINUX__) // CUDA
	#define USE_CUDA_SDK
	#define CUDA_WRAPPER
#endif

#ifdef USE_CUDA_SDK
#ifndef CUDA_WRAPPER
#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_gl_interop.h>

#if defined(__WIN32__)
	#pragma comment(lib, "cudart_static.lib")
#else defined(__LINUX__)
	#pragma comment(lib, "libcudart_static.a")
	#endif
#endif

#include "cudaDefines.h"

#define __vrcu \
{ \
	cudaError cudaLastError = cudaGetLastError(); \
	if (cudaLastError != cudaSuccess) \
	{ \
		printf("CUDA error %d %s (%s %d)\n", \
		cudaLastError, cudaGetErrorString(cudaLastError), __FILE__,__LINE__); \
	} \
}
#endif

#define __check_hr \
{ \
	if (hr != S_OK && hr != S_FALSE) \
	{ \
		printf("HRESULT error %d (%s %d)\n", \
		hr, __FILE__,__LINE__); \
	} \
}

///////////////////////////////////////////////////////////////////////////////
