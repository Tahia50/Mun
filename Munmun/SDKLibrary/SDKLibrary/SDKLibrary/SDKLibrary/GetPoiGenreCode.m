//
//  GetPoiGenreCode.m
//  SDKLibrary
//
//  Created by  on 11/24/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "GetPoiGenreCode.h"
#import "Libs.h"
#import "ServiceLib.h"

@implementation GetPoiGenreCode
+ (void)getPOIGenreCodeRequest:(NSString*)url params:(NSDictionary*)params completion: (void (^)(NSMutableArray*))complete failure :(void (^)(NSError*))failure {
    @autoreleasepool {
        [ServiceLib sendRequest:url params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
            
            NSMutableArray *array = [[NSMutableArray alloc] init];
            if (jsonDict && [jsonDict isKindOfClass:[NSDictionary class]]) {
                NSInteger hit = [[jsonDict objectForKey:@"hit"] integerValue];
                NSArray *arr = [jsonDict objectForKey:@"poi"];
                if (arr && [arr isKindOfClass:[NSArray class]]) {
                    for (int i = 0 ; i < [arr count] ; i++) {
                        //remove object none infomation
                        if ([[[arr objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"00000000"]) {
                            continue;
                        }
                        PoiGenre *poi = [[PoiGenre alloc] initWithDictionary:[arr objectAtIndex:i]];
                        poi.hit = hit;
                        [array addObject:poi];
                    }
                }
            }
            complete(array);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}
@end
