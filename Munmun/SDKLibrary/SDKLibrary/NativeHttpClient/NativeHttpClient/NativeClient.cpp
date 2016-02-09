//
//  NativeClient.cpp
//  NativeHttpClient
//
//  Created by  on 11/18/15.
//  Copyright © 2015 NativeHttpClient. All rights reserved.
//

#include "NativeClient.hpp"
#include <stdlib.h>

#define TIMEOUT_MS          30000

NativeClient::NativeClient() { curl = curl_easy_init(); }

NativeClient::~NativeClient() { curl_easy_cleanup(curl); }

size_t write_data(void *contents, size_t size, size_t nmemb, void *userp) {
    size_t realsize = size * nmemb;
    struct NATIVE_RESP *resp = (struct NATIVE_RESP *)userp;

    resp->mem = (LPBYTE)realloc(resp->mem, resp->size + realsize + 1);
    if (resp->mem == NULL) {
        /* out of memory! */
        printf("not enough memory (realloc returned NULL)\n");
        exit(EXIT_FAILURE);
    }
    memcpy(&(resp->mem[resp->size]), contents, realsize);
    resp->size += realsize;
    resp->mem[resp->size] = 0;
    return realsize;
}

NATIVE_RESP NativeClient::doGetRequest(const std::string &url) {
    curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
    /* example.com is redirected, so we tell libcurl to follow redirection */
    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
    curl_easy_setopt(curl, CURLOPT_NOSIGNAL,
                     1); // Prevent "longjmp causes uninitialized stack frame" bug
    curl_easy_setopt(curl, CURLOPT_ACCEPT_ENCODING, "deflate");
    NATIVE_RESP resp;
    resp.mem = (LPBYTE)malloc(1); ;
    resp.size = 0;
    resp.code = CURLE_OK;
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&resp);
    curl_easy_setopt(curl, CURLOPT_USERAGENT, "libcurl-agent/1.0");
    curl_easy_setopt(curl, CURLOPT_TIMEOUT_MS, TIMEOUT_MS);
    curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT_MS, TIMEOUT_MS);
    CURLcode resCode = curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    /* Check for errors */
    if (resCode != CURLE_OK) {
        fprintf(stderr, "curl_easy_perform() failed: %s\n",
                curl_easy_strerror(resCode));
    }
    resp.code = resCode;
    return resp;
}