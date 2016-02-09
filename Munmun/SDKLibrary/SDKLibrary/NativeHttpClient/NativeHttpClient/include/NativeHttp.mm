//
//  NativeHttp.m
//  NativeHttpClient
//
//  Created by  on 11/17/15.
//  Copyright © 2015 NativeHttpClient. All rights reserved.
//

#import "NativeHttp.h"
#import "NativeClient.hpp"
#import "curl.h"

#define kMaxQueue           5

@implementation NativeHttp

+ (NativeHttp*)shareNativeHttp {
    // Create a singleton.
    static dispatch_once_t once;
    static NativeHttp *nativeHttp;
    dispatch_once(&once, ^ {
        nativeHttp = [[NativeHttp alloc] init];
    });
    return nativeHttp;
}

-(instancetype)init {
    if (self = [super init]) {
        queue = [NSOperationQueue new];
        [queue setMaxConcurrentOperationCount: kMaxQueue];
    };
    return self;
}

- (void)nativeSendRequest:(NSString *) url completion: (void (^)(NSNumber *errorCode, NSData* response))complete {
    NativeClient *nativeClient = new NativeClient();
    NATIVE_RESP resp = nativeClient->doGetRequest([url UTF8String]);
    NSData *respData = [NSData dataWithBytes:resp.mem length:resp.size];
    complete([NSNumber numberWithInt:resp.code],respData);
}

- (void)cancelRequest {
    [queue cancelAllOperations];
}

- (void)sendRequest:(NSString *) url completion: (void (^)(NSNumber *errorCode, NSData* response))complete {
    NSBlockOperation *operation = [[NSBlockOperation alloc] init];
    __weak NSBlockOperation *weakOperation = operation;
    [operation addExecutionBlock: ^ {
        if ([weakOperation isCancelled]){
            return;
        }
        [self nativeSendRequest:url completion:^(NSNumber *errorCode, NSData *response) {
            if ([weakOperation isCancelled]){
                return;
            }
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                complete(errorCode,response);
            }];
        }];
    }];
    [queue addOperation:operation];
    operation = nil;
}

+(void)sendGetRequest:(NSString *) url completion: (void (^)(NSNumber *errorCode, NSData* response))complete{
    [[NativeHttp shareNativeHttp] sendRequest:url completion:complete];
}

@end