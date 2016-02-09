//
//  GetPoiGenreCode.h
//  SDKLibrary
//
//  Created by  on 11/24/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PoiGenre.h"
#define SEARCH_POI_GENRE_CODE_PATH     @"poi/genrecode.php"
#define SEARCH_POI_GENRE_CODE_URL      ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, SEARCH_POI_GENRE_CODE_PATH])

@interface GetPoiGenreCode : NSObject
+ (void)getPOIGenreCodeRequest:(NSString*)url params:(NSDictionary*)params completion: (void (^)(NSMutableArray*))complete failure :(void (^)(NSError*))failure;
@end
