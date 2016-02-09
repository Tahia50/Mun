//
//  NativeHttpHelper.m
//  SDKLibrary
//
//  Created by  on 12/9/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "NativeHttpHelper.h"
#import "NativeHttp.h"

@implementation NativeHttpHelper

+ (void)cancelRequest {
    [[NativeHttp shareNativeHttp] cancelRequest];
}

@end
