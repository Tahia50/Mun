//
//  NaviRequest.m
//  SDKLibrary
//
//  Created by  on 12/18/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "NaviRequest.h"
#import "Libs.h"
#import "ServiceLib.h"
#import "ModelParamsDefine.h"
#import "ErrorUtils.h"

@implementation NaviRequest

+ (void)startRequestWithUrlString:(NSString*)url params:(NSDictionary*)params completion: (void (^)(id))complete failure :(void (^)(NSError*))failure {
    @autoreleasepool {
        [ServiceLib sendRequest:url params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            if (!response || [response isEqualToString:kStringEmpty]) {
                failure([ErrorUtils defaultError]);
                return ;
            }
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
            complete(jsonDict);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

+ (void)requestNaviList:(NSMutableDictionary *)params completion:(void (^)(id response))complete failure:(void (^)(NSError *error))failure {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBASE_URL, kAPI_GET_POI_NAVI];
    if (!params) {
        params = [NSMutableDictionary new];
    }
    [self startRequestWithUrlString:urlString params:params completion:^(id response) {
        complete(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
