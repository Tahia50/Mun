//
//  GetAddressByLatLon.m
//  SDKLibrary
//
//  Created by  on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "GetAddressByLatLon.h"
#import "Libs.h"
#import "ServiceLib.h"
#import "ErrorUtils.h"

@implementation GetAddressByLatLon

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
            AddressLocation *poiAdd = [[AddressLocation alloc] initWithDictionary:[[jsonDict objectAtIndex:0] objectForKey:@"address"]];
            [array addObject:poiAdd];
            complete(array);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

@end
