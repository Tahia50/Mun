//
//  ErrorUtils.m
//  SDKLibrary
//
//  Created by  on 12/14/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "ErrorUtils.h"
#import "SDKErrorCodeDefine.h"
#import "ModelParamsDefine.h"

@implementation ErrorUtils
+(NSError*)defaultError {
    NSMutableDictionary *details = [NSMutableDictionary dictionary];
    [details setValue:E0001 forKey:NSLocalizedDescriptionKey];
    // populate the error object with the details
    return [NSError errorWithDomain:kStringEmpty code:STATUS_CODE_UNSUPPORTED_PROTOCOL userInfo:details];
}

+(NSError*)emtyRestuError {
    NSMutableDictionary *details = [NSMutableDictionary dictionary];
    [details setValue:E0035 forKey:NSLocalizedDescriptionKey];
    // populate the error object with the details
    return [NSError errorWithDomain:kStringEmpty code:STATUS_CODE_EMPTY_DATA userInfo:details];
}

+(NSError*)errorWithCode:(NSNumber*)code{
    NSString *errorKey = E0001;
    switch ([code intValue]) {
        case STATUS_CODE_EMPTY_DATA:
            errorKey = E0035;
            break;
        default:
            errorKey = E0001;
            break;
    }
    NSMutableDictionary *details = [NSMutableDictionary dictionary];
    [details setValue:errorKey forKey:NSLocalizedDescriptionKey];
    // populate the error object with the details
    return [NSError errorWithDomain:kStringEmpty code:[code intValue] userInfo:details];
}

@end
