//
//  GetAddressByLatLon.h
//  SDKLibrary
//
//  Created by  on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressLocation.h"

#define ADD_BY_LAT_LON_PATH         @"location2/address_mlang.php"
#define ADD_BY_LAT_LON_URL          ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, ADD_BY_LAT_LON_PATH])

#define PARAM_LAT_LON               @"latlon"
#define PARAM_DATUM                 @"datum"
#define PARAM_RADIUS                @"radius"
//#define kRadiusVal                  @"2000"

#define DATUM_TOKYO                 @"TOKYO"
#define DATUM_INTERNATIONAL         @"WGS84"

@interface GetAddressByLatLon : NSObject
+ (void)requestAddressByLatlon:(NSDictionary*)params completion: (void (^)(NSMutableArray*))complete failure :(void (^)(NSError*))failure;
@end
