//
//  Config.h
//  SDKLibrary
//
//  Created by  on 11/19/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#define kBASE_URL                       @"http://test.mlang.its-mo.com//Its_moNavi_ios_v200/"
#define kBASE_URL_FREEWORD              @"http://test.mlang.its-mo.com/mlang_search_v200/"
#define kAPI_FREEWORD                   @"comb/word.php"
#define kAPI_GET_RASTER_IMG             @"cgi/GetRasterImg.php"
#define kGET_RASTER_IMG                 @"http://test.mlang.its-mo.com//Its_moNavi_ios_v200/cgi/GetRasterImg.php?lat=%ld&lng=%ld&language=%@"
#define SEARCH_POI_GENRE_CODE_PATH      @"poi/genrecode.php"
#define SEARCH_POI_GENRE_CODE_URL      ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, SEARCH_POI_GENRE_CODE_PATH])
#define kAPI_GET_POI_NAVI               @"cgi/index.php"

#define kPageSizeSearchResult           20

#import <Foundation/Foundation.h>

#define BASE_SDK_URL                                ([Config getBaseURL])
#define DB_SDK_NAME                                 ([Config getDBName])
#define DB_SDK_FULL_PATH                            ([Config getDbFullPath])
#define ROOT_PATH                                   ([Config getRootPath])
#define DB_PATH                                     ([Config getDBPath])
#define PLIST_PATH                                  ([Config getPlistPath])
#define MAP_PATH                                    ([Config getMapPath])
#define USER_PATH                                   ([Config getUserPath])
#define LOG_PATH                                    ([Config getLogPath])

@interface Config : NSObject
@property(nonatomic, strong)NSString *baseURL;
@property(nonatomic, strong)NSString *dbName;

+ (Config*)sharedSConfig;

- (void)initDirectory;

+ (NSString*)getBaseURL;
+ (NSString*)getDBName;
+ (NSString*)getRootPath;
+ (NSString*)getDBPath;
+ (NSString*)getPlistPath;
+ (NSString*)getMapPath;
+ (NSString*)getUserPath;
+ (NSString*)getLogPath;

@end