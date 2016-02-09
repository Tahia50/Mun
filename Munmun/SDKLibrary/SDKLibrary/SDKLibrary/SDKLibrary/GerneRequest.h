//
//  GerneRequest.h
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gerne.h"
#import "Config.h"
#import "ModelParamsDefine.h"

#define GENRE_SEARCH_PATH        @"/poi/genrecode.php"
#define SEARCH_SUB_CATE_URL      ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, GENRE_SEARCH_PATH])

#define LIMIT_DEFAULT            @"20"
#define LANGUAGE_DEFAULT         @"jp"
#define ADDR_CODE_DEFAULT        @"13"

@interface GerneRequest : NSObject

/*!
 * @brief Request gerne list and then execute result block
 * @param callBack NSMutableArray (array Gerne)
 */
+ (void)requestGerne:(void (^)(NSMutableArray *))callBack;

/*!
 * @brief Request subgenre api and then execute result block
 * @param params NSDictionary: paramaters to request.
 * @param completion A result completion block (NSMutableArray,NSDictionary)
 * @param failure A result failure block (NSError)
 */
+ (void)requestSubGerne: (NSDictionary*)params
               completion: (void (^)(NSMutableArray*))complete
                 failure :(void (^)(NSError*))failure;

+ (void)requestAddress:(NSDictionary*)params
                 level: (AddressLevel)level
            completion: (void (^)(NSMutableArray*result))complete
              failure :(void (^)(NSError*error))failure;
@end
