//
//  AddressRequest.m
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "AddressRequest.h"
#import "Libs.h"
#import "ServiceLib.h"
#import "ModelParamsDefine.h"
#import "ErrorUtils.h"

@implementation AddressRequest

+(void)requestAddressList:(NSDictionary*)params completion: (void (^)(NSMutableArray*))complete failure :(void (^)(NSError*))failure
{
    @autoreleasepool {
        [ServiceLib sendRequest:ADD_SEARCH_URL params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            if (!response || [response isEqualToString:kStringEmpty]) {
                failure([ErrorUtils defaultError]);
                return ;
            }
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];

            NSMutableArray *array = [[NSMutableArray alloc] init];
            NSArray *listItems = [jsonDict objectForKey:kItem];
            NSInteger hit = [[[jsonDict objectForKey:kInfo] objectForKey:kHit] integerValue];
            if (listItems && [listItems isKindOfClass:[NSArray class]]) {
                for (int i = 0 ; i < [listItems count] ; i++) {
                    Address *poiAdd = [[Address alloc] initWithDictionary:[listItems objectAtIndex:i]];
                    poiAdd.hit = hit;
                    [array addObject:poiAdd];
                }
            }
            complete(array);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

+ (void)requestAddressByLatlon:(NSDictionary*)params completion: (void (^)(NSMutableArray*))complete failure :(void (^)(NSError*))failure {
    @autoreleasepool {
        [ServiceLib sendRequest:ADD_BY_LAT_LON_URL params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSArray *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
            NSMutableArray *array = [[NSMutableArray alloc] init];
            if (!jsonDict && ![jsonDict isKindOfClass:[NSArray class]]) {
                failure ([ErrorUtils defaultError]);
                return ;
            }
            if ([jsonDict count] <= 0) {
                failure ([ErrorUtils defaultError]);
                return ;
            }
            if (![[jsonDict objectAtIndex:0] isKindOfClass:[NSDictionary class]]) {
                complete(array);
                return ;
            }
            AddressLocation *poiAdd = [[AddressLocation alloc] initWithDictionary:[[jsonDict objectAtIndex:0] objectForKey:kAddress]];
            NSArray *latlon = [[params objectForKey:kLatLon] componentsSeparatedByString:@","];
            poiAdd.point = [NSDictionary dictionaryWithObjectsAndKeys:[latlon firstObject], kLat, [latlon lastObject], kLon, nil];
            [array addObject:poiAdd];
            complete(array);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

@end