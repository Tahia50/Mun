//
//  NativeClient.hpp
//  NativeHttpClient
//
//  Created by  on 11/18/15.
//  Copyright © 2015 NativeHttpClient. All rights reserved.
//

#ifndef NativeClient_hpp
#define NativeClient_hpp

#include <sstream>
#include <iostream>
#include <math.h>
#include <stdio.h>
#include "curl.h"
#include "curlbuild.h"
#ifndef BYTE
typedef const char BYTE;
typedef char* LPBYTE;
#endif

typedef struct NATIVE_RESP {
    size_t size;
    LPBYTE  mem;
    CURLcode code;
} NATIVE_RESP, *LPNATIVE_RESP;

using namespace std;

class NativeClient {

public:
    NativeClient();
    ~NativeClient();
    NATIVE_RESP doGetRequest(const std::string &url);

private:
    void *curl;
};

#endif /* NativeClient_hpp */
