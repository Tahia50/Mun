//
//  SearchModel.m
//  SDKLibrary
//
//  Created by  on 1/5/16.
//  Copyright © 2016 SDK. All rights reserved.
//

#import "SearchModel.h"
#import "Libs.h"
#import "ServiceLib.h"
#import "ModelParamsDefine.h"
#import "ErrorUtils.h"
#import "AddressRequest.h"

@implementation SearchModel

+ (void)startRequestSearchNaviTop:(NSMutableDictionary *)params completion:(void (^)(id respone))complete failure:(void(^)(NSError *error))failure {
    if (!params) {
        params = [NSMutableDictionary new];
    }
    [params setValue:@"" forKey:kAddrStart];
    [params setValue:@"" forKey:kAddrGoal];
    [params setValue:@"" forKey:kCKBN_Map0];
    [params setValue:@"" forKey:kCKBN_Map1];
    [params setValue:@"" forKey:kCKBN_Map2];
    [params setValue:@"" forKey:kCKBN_Map3];
    [params setValue:@"" forKey:kCKBN_Map4];
    [params setValue:@"0" forKey:kCountStart];
    [params setValue:@"0" forKey:kCountGoal];
    [params setValue:@"0" forKey:kErrStart];
    [params setValue:@"0" forKey:kErrGoal];
    [params setValue:@"1" forKey:kStatus];
    [params setValue:@"1" forKey:kHighway];
    [params setValue:@"1" forKey:kTRLVL];
    [params setValue:@"1" forKey:kServiceCDFMT];
    [params setValue:@"1" forKey:kNoZip];
    [params setValue:@"" forKey:kBlocklineCD];
    [params setValue:@"" forKey:kEDCD];
    [params setValue:@"navi_result" forKey:kAction];
    
    if (![params objectForKey:kCKBN_Map0]) {
        [params setValue:@"" forKey:kCKBN_Map0];
    }
    if (![params objectForKey:kCKBN_Map1]) {
        [params setValue:@"" forKey:kCKBN_Map1];
    }
    if (![params objectForKey:kCKBN_Map2]) {
        [params setValue:@"" forKey:kCKBN_Map2];
    }
    if (![params objectForKey:kCKBN_Map3]) {
        [params setValue:@"" forKey:kCKBN_Map3];
    }
    if (![params objectForKey:kCKBN_Map4]) {
        [params setValue:@"" forKey:kCKBN_Map4];
    }
    if (![params objectForKey:kTransit]) {
        [params setValue:@"" forKey:kTransit];
    }
    if (![params objectForKey:kWalk]) {
        [params setValue:@"" forKey:kWalk];
    }
    if (![params objectForKey:kExpress]) {
        [params setValue:@"0" forKey:kExpress];
    }
    if (![params objectForKey:kVics]) {
        [params setValue:@"" forKey:kVics];
    }
    if (![params objectForKey:kSpeed1]) {
        [params setValue:@"" forKey:kSpeed1];
    }
    if (![params objectForKey:kSpeed2]) {
        [params setValue:@"" forKey:kSpeed2];
    }
    if (![params objectForKey:kSpeed3]) {
        [params setValue:@"" forKey:kSpeed3];
    }
    if (![params objectForKey:kSpeed4]) {
        [params setValue:@"" forKey:kSpeed4];
    }
    if (![params objectForKey:kSTR]) {
        [params setValue:@"0" forKey:kSTR];
    }
    if (![params objectForKey:kSTRBY]) {
        [params setValue:@"0" forKey:kSTRBY];
    }
    if (![params objectForKey:kCar_Type]) {
        [params setValue:@"0" forKey:kCar_Type];
    }
    if (![params objectForKey:kSmartic]) {
        [params setValue:@"0" forKey:kSmartic];
    }
    if (![params objectForKey:kORBIS]) {
        [params setValue:@"0" forKey:kORBIS];
    }
    if (![params objectForKey:kMN1]) {
        [params setValue:@"" forKey:kMN1];
    }
    if (![params objectForKey:kMN2]) {
        [params setValue:@"" forKey:kMN2];
    }
    if (![params objectForKey:kMN3]) {
        [params setValue:@"" forKey:kMN3];
    }
    if (![params objectForKey:kMX1]) {
        [params setValue:@"" forKey:kMX1];
    }
    if (![params objectForKey:kMX2]) {
        [params setValue:@"" forKey:kMX2];
    }
    if (![params objectForKey:kMX3]) {
        [params setValue:@"" forKey:kMX3];
    }
    if (![params objectForKey:kMY1]) {
        [params setValue:@"" forKey:kMY1];
    }
    if (![params objectForKey:kMY2]) {
        [params setValue:@"" forKey:kMY2];
    }
    if (![params objectForKey:kMY3]) {
        [params setValue:@"" forKey:kMY3];
    }
    if (![params objectForKey:kMIN1]) {
        [params setValue:@"" forKey:kMIN1];
    }
    if (![params objectForKey:kMIN2]) {
        [params setValue:@"" forKey:kMIN2];
    }
    if (![params objectForKey:kMIN3]) {
        [params setValue:@"" forKey:kMIN3];
    }
    if (![params objectForKey:kMNX1]) {
        [params setValue:@"" forKey:kMNX1];
    }
    if (![params objectForKey:kMNX2]) {
        [params setValue:@"" forKey:kMNX2];
    }
    if (![params objectForKey:kMNX3]) {
        [params setValue:@"" forKey:kMNX3];
    }
    if (![params objectForKey:kMY1]) {
        [params setValue:@"" forKey:kMY1];
    }
    if (![params objectForKey:kMY2]) {
        [params setValue:@"" forKey:kMY2];
    }
    if (![params objectForKey:kMY3]) {
        [params setValue:@"" forKey:kMY3];
    }
    if (![params objectForKey:kMNY1]) {
        [params setValue:@"" forKey:kMNY1];
    }
    if (![params objectForKey:kMNY2]) {
        [params setValue:@"" forKey:kMNY2];
    }
    if (![params objectForKey:kMNY3]) {
        [params setValue:@"" forKey:kMNY3];
    }
    if (![params objectForKey:kP17]) {
        [params setValue:@"" forKey:kP17];
    }
    if (![params objectForKey:kP16]) {
        [params setValue:@"" forKey:kP16];
    }
    if (![params objectForKey:kSNX]) {
        [params setValue:@"" forKey:kSNX];
    }
    if (![params objectForKey:kSNY]) {
        [params setValue:@"" forKey:kSNY];
    }
    if (![params objectForKey:kSTCD]) {
        [params setValue:@"" forKey:kSTCD];
    }
    @autoreleasepool {
        [ServiceLib sendRequest:NAVI_TOP_URL params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            if (!response || [response isEqualToString:kStringEmpty]) {
                failure([ErrorUtils defaultError]);
                return ;
            }
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
            complete(jsonData);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

+ (void)startRequestGetAddressByLatLng:(NSMutableDictionary *)params completion:(void(^)(id response))complete failure:(void(^)(NSError *error))failure {
    if (!params) {
        params = [NSMutableDictionary new];
    }
    @autoreleasepool {
        [ServiceLib sendRequest:ADD_BY_LAT_LON_URL params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            if (!response || [response isEqualToString:kStringEmpty]) {
                failure([ErrorUtils defaultError]);
                return ;
            }
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSDictionary *jsonDict = [jsonArray firstObject];
            complete(jsonDict);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

@end
