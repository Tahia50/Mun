//
//  NaviRequest.h
//  SDKLibrary
//
//  Created by  on 12/18/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"

#define ADD_SEARCH_PATH        @"address/list.php"
#define ADD_SEARCH_URL      ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, ADD_SEARCH_PATH])

@interface NaviRequest : NSObject

+ (void)requestNaviList:(NSMutableDictionary *)params
              completion:(void (^)(id response))complete
                 failure:(void (^)(NSError *error))failure;

@end
