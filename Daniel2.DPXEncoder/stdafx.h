// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#include "targetver.h"
#include <Windows.h>
#include <atlbase.h>

#include <cstdio>
#include <tchar.h>
#include <conio.h>

#include <Cinecoder_h.h>
#include <Cinecoder.Plugin.Multiplexers.h>
#include <iostream>

int print_error(int err, const char *str = nullptr);
