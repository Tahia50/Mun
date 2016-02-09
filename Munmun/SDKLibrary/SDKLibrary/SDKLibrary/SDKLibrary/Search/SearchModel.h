//
//  SearchModel.h
//  SDKLibrary
//
//  Created by  on 1/5/16.
//  Copyright © 2016 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NAVI_TOP_SEARCH_PATH                    @"Its_moNavi_ios_v200/cgi/index.php"
//#define NAVI_TOP_URL                            ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, NAVI_TOP_SEARCH_PATH])
#define NAVI_TOP_URL                            @"http://test.mlang.its-mo.com/Its_moNavi_ios_v200/cgi/index.php"
#define ADDRESS_BY_LATLNG_URL                   @"http://test.mlang.its-mo.com/Its_moNavi_ios_v200/cgi/index.php"


#define kCar_Type                           @"cartype"
#define kAction                             @"action"
#define kC                                  @"c"
#define kUID                                @"uid"
#define kP16                                @"p16"
#define kP17                                @"p17"
#define kStatus                             @"status"
#define kStartSearch                        @"start_search"
#define kGoalSearch                         @"goal_search"
#define kAddrGoal                           @"addr_goal"
#define kAddrStart                          @"addr_start"
#define kCKBN_Map0                          @"ckbn_map0"
#define kCKBN_Map1                          @"ckbn_map1"
#define kCKBN_Map2                          @"ckbn_map2"
#define kCKBN_Map3                          @"ckbn_map3"
#define kCKBN_Map4                          @"ckbn_map4"
#define kCountGoal                          @"count_goal"
#define kCountStart                         @"count_start"
#define kErrStart                           @"err_start"
#define kErrGoal                            @"err_goal"
#define kCID                                @"cid"
#define kUse                                @"use"
#define kStart                              @"start"
#define kSX                                 @"sx"
#define kSY                                 @"sy"
#define kSZ                                 @"sz"
#define kSIN                                @"sin"
#define kSIN                                @"sin"
#define kSNX                                @"snx"
#define kSNY                                @"sny"
#define kMN1                                @"mn1"
#define kMX1                                @"mx1"
#define kMY1                                @"my1"
#define kMIN1                               @"min1"
#define kMNX1                               @"mnx1"
#define kMNY1                               @"mny1"

#define kMN2                                @"mn2"
#define kMX2                                @"mx2"
#define kMY2                                @"my2"
#define kMIN2                               @"min2"
#define kMNX2                               @"mnx2"
#define kMNY2                               @"mny2"

#define kMN3                                @"mn3"
#define kMX3                                @"mx3"
#define kMY3                                @"my3"
#define kMIN3                               @"min3"
#define kMNX3                               @"mnx3"
#define kMNY3                               @"mny3"

#define kGoal                               @"goal"
#define kGX                                 @"gx"
#define kGY                                 @"gy"
#define kGZ                                 @"gz"
#define kGIN                                @"gin"
#define kGNX                                @"gnx"
#define kGNY                                @"gny"
#define kWhen                               @"when"
#define kDate                               @"date"
#define kTime                               @"time"
#define kTransit                            @"transit"
#define kWalk                               @"walk"
#define kExpress                            @"express"
#define kVics                               @"vics"
#define kSpeed1                             @"speed1"
#define kSpeed2                             @"speed2"
#define kSpeed3                             @"speed3"
#define kSpeed4                             @"speed4"
#define kHighway                            @"highway"
#define kSTR                                @"str"
#define kSTRBY                              @"strby"
#define kSmartic                            @"smartic"
#define kOnHighway                          @"on_highway"
#define kORBIS                              @"orbis"
#define kSTCD                               @"stcd"
#define kEDCD                               @"edcd"
#define kBlocklineCD                        @"blockline_cd"
#define kTRLVL                              @"stlvl"
#define kServiceCDFMT                       @"service_cd_fmt"
#define kNoZip                              @"_nozip"

@interface SearchModel : NSObject

+ (void)startRequestSearchNaviTop:(NSMutableDictionary *)params
                       completion:(void (^)(id respone))complete
                          failure:(void(^)(NSError *error))failure;

+ (void)startRequestGetAddressByLatLng:(NSMutableDictionary *)params
                            completion:(void(^)(id response))complete
                               failure:(void(^)(NSError *error))failure;

@end
