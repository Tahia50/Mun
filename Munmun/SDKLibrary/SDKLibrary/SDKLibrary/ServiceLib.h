//
//  ServiceLib.h
//  SOS
//
//  Created by Toan M. Ha on 2/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceLib : NSObject

+ (void)sendGetRequest:(NSString *)url
            completion:(void (^)(NSString *response))complete
               failure:(void (^)(NSError *error))failure;

+ (void)sendRequest:(NSString *)url
             params:(NSDictionary*)params
         completion:(void (^)(NSString *response))complete
            failure:(void (^)(NSError *error))failure;

+(void)executeResult:(NSNumber*)errorCode :(NSData*)response
          completion:(void (^)(NSString *responseStr))complete
             failure:(void (^)(NSError *error))failure;

@end