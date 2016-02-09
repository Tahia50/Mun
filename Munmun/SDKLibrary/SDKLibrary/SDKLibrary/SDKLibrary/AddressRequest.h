//
//  AddressRequest.h
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
#import "Config.h"
#import "AddressLocation.h"

#define ADD_SEARCH_PATH        @"address/list.php"
#define ADD_SEARCH_URL      ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, ADD_SEARCH_PATH])

#define PARAM_LIMIT      @"limit"
#define PARAM_ADD_CODE   @"addrcode"
#define PARAM_DATUM      @"datum"
#define PARAM_LANGUAGE   @"multilanguage"

#define DATUM_TOKYO                             @"TOKYO"
#define DATUM_INTERNATIONAL                     @"WGS84"
#define ADD_BY_LAT_LON_PATH                     @"location2/address_mlang.php"
#define ADD_BY_LAT_LON_URL          ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, ADD_BY_LAT_LON_PATH])

#define PARAM_LAT_LON               @"latlon"
#define PARAM_RADIUS                @"radius"
//#define kRadiusVal                  @"2000"

@interface AddressRequest : NSObject
/*!
 * @brief Request Address by address code api and then execute result block
 * @param params NSDictionary: paramaters to request. params = nill to request level 1.
 * @param completion A result completion block (NSMutableArray,NSDictionary)
 * @param failure A result failure block (NSError)
 * @code      [AddressRequest requestAddressList:params
 completion:^(NSMutableArray *result)
 {
     //TODO something
 }
 failure:^(NSError *error)
 {
 [m_activityIndicator stopAnimating];
    //TODO something
 }];
 */
+ (void)requestAddressList:(NSDictionary*)params completion: (void (^)(NSMutableArray*))complete failure :(void (^)(NSError*))failure;
/*!
 * @brief Request Address by latlon api and then execute result block
 * @param params NSDictionary: paramaters to request.
 * @param completion A result completion block (NSMutableArray,NSDictionary)
 * @param failure A result failure block (NSError)
 * @code       [AddressRequest requestAddressByLatlon:params
 completion:^(NSMutableArray *result)
 {
 }
 failure:^(NSError *error)
 {
 }];
 */
+ (void)requestAddressByLatlon:(NSDictionary *)params completion: (void (^)(NSMutableArray *respone))complete failure :(void (^)(NSError *error))failure;

@end
