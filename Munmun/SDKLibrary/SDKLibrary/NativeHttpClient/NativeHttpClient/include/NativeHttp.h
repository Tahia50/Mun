//
//  NativeHttp.h
//  NativeHttpClient
//
//  Created by  on 11/17/15.
//  Copyright © 2015 NativeHttpClient. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NativeHttp : NSObject {
    NSOperationQueue *queue;
}
- (void)nativeSendRequest:(NSString *) url completion: (void (^)(NSNumber *errorCode, NSData* response))complete;
- (void)cancelRequest;

+ (NativeHttp*)shareNativeHttp;
+(void)sendGetRequest:(NSString *) url completion: (void (^)(NSNumber *errorCode, NSData* response))complete;

@end