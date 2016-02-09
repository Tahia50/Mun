//
//  ServiceLib.m
//  SOS
//
//  Created by Toan M. Ha on 2/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ServiceLib.h"
#import "ZipArchive.h"
#import "NativeHttp.h"
#import "ModelParamsDefine.h"
#import "SDKErrorCodeDefine.h"
#import "ErrorUtils.h"
#import "ZlibDataDecompressor.h"
#import "Libs.h"
#import "Language.h"

#define kTempZipFile        @"a.zip"
#define kTempZLipFile        @"a.zlip"
#define kTemFile            @"a"
#define kFirstParamsFormat  @"%@?%@=%@"
#define kNextParamsFormat   @"%@&%@=%@"

@implementation ServiceLib

+ (void)sendGetRequest:(NSString *)url
            completion:(void (^)(NSString *))complete
               failure:(void (^)(NSError *))failure {
    [NativeHttp sendGetRequest:url completion:^(NSNumber *errorCode, NSData *response) {
        [ServiceLib executeResult:(NSNumber*) errorCode :response completion:^(NSString *response) {
            complete(response);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }];
}

+ (void)sendRequest:(NSString *)url
             params:(NSDictionary *)params
         completion:(void (^)(NSString *response))complete
            failure:(void (^)(NSError *error))failure {
    if (![Libs hasNetworkConnection]) {
        failure([ErrorUtils defaultError]);
        return;
    }
    NSString *paramStr = @"";
    if (params) {
        if (![params objectForKey:kLanguage]) {
            NSMutableDictionary *newParams = [NSMutableDictionary dictionaryWithObjectsAndKeys:[Language getCurrentLangCode], kLanguage, nil];
            [newParams addEntriesFromDictionary:params];
            params = [newParams mutableCopy];
        }
        if (![params objectForKey:kMLanguage]) {
            NSMutableDictionary *newParams = [NSMutableDictionary dictionaryWithObjectsAndKeys:[Language getCurrentLangCode], kMLanguage, nil];
            [newParams addEntriesFromDictionary:params];
            params = [newParams mutableCopy];
        }
        if (![params objectForKey:kNozip]) {
            NSMutableDictionary *newParams = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1", kNozip, nil];
            [newParams addEntriesFromDictionary:params];
            params = [newParams mutableCopy];
        }
        NSEnumerator *keys = [params keyEnumerator];
        for (int i = 0; i < [params count]; i++) {
            NSString *key = [keys nextObject];
            NSString *val = [NSString stringWithFormat:@"%@", [params objectForKey:key]];
            NSString *paramsFormat =
            (i == 0) ? kFirstParamsFormat : kNextParamsFormat;
            paramStr = [NSString stringWithFormat:paramsFormat, paramStr, key,
                        [val stringByAddingPercentEncodingWithAllowedCharacters:
                         [NSCharacterSet URLHostAllowedCharacterSet]]];
        }
        url = [NSString stringWithFormat:@"%@%@", url, paramStr];
    }
    [NativeHttp sendGetRequest:url completion:^(NSNumber *errorCode, NSData *response) {
        [ServiceLib executeResult:(NSNumber*) errorCode :response completion:^(NSString *response) {
            if (!response || [response isEqualToString:kStringEmpty]) {
                failure([ErrorUtils defaultError]);
                return ;
            }
            complete(response);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }];
}

+(void)executeResult:(NSNumber*)errorCode :(NSData*)response
          completion:(void (^)(NSString *responseStr))complete
             failure:(void (^)(NSError *error))failure{
    if([errorCode intValue] != STATUS_CODE_OK) {
        NSError *error = [ErrorUtils errorWithCode:errorCode];
        failure(error);
        return;
    }
    NSString* responseStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    if (responseStr) {
        complete(responseStr);
        return ;
    }
    NSData *zlibData = [ZlibDataDecompressor uncompressData:response error:NULL];
    responseStr = [[NSString alloc] initWithData:zlibData encoding:NSUTF8StringEncoding];
    if (responseStr && ![responseStr isEqualToString:kStringEmpty]) {
        complete(responseStr);
        zlibData = nil;
        return ;
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(
                                                         NSCachesDirectory, NSUserDomainMask, YES);
    NSError *error;
    NSString *path = [paths objectAtIndex:0];
    NSString *zipPath = [path stringByAppendingPathComponent:kTempZLipFile];
    [response writeToFile:zipPath options:0 error:&error];

    ZipArchive *za = [[ZipArchive alloc] init];
    if (![za UnzipOpenFile:zipPath]) {
        failure([ErrorUtils defaultError]);
        return;
    }

    if (![za UnzipFileTo:path overWrite:YES]) {
        failure([ErrorUtils defaultError]);
        return;
    }

    [za UnzipCloseFile];
    NSString *textFilePath = [path stringByAppendingPathComponent:kTemFile];
    NSString *textString = [NSString stringWithContentsOfFile:textFilePath
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        complete(textString);
    });
}

@end