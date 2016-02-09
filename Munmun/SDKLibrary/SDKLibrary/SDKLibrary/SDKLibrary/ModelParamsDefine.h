//
//  ModelParamsDefine.h
//  SDKLibrary
//
//  Created by MrKien on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#ifndef ModelParamsDefine_h
#define ModelParamsDefine_h

#define FAKE_API                        1

#define LOCAL_API                       0

#define IOS_8                           8.0
#define OS_VERSION                      ([[[UIDevice currentDevice] systemVersion] floatValue])
#define OS_VERSION_LOWER_IOS_8          (OS_VERSION < IOS_8)

#define kDefaultKey                     @"ja"
#define kDefaultLangKey                 @"jp"
#define kStringEmpty                    @""
#define kDefaultLimitPage               20
#define kLimitHistory                   20
#define kLimitFavourite                 300
#define kLimitRoute                     100
#define kZero                            0


// Directory

#define kRootDirectory              @"Library"
#define kMapDirectory               @"MAP"
#define kUserDirectory              @"USER"
#define kDbDirectory                @"DB"
#define kPlistDirectory             @"PLIST"
#define kPoiDirectory               @"POI"
#define kLogDirectory               @"LOGS"
#define BUNDLE                      @"bundle"
#define kSDKBundle                  @"SDKBundle"

// SDKSettingData
#define kSDKSettingData             @"SDKSettingData.plist"
#define PLIST                       @"plist"
#define kRoute                      @"route"

// Poi CKBN
#define POI_CKBN_WP_ORBIS           @"WP_ORBIS"
#define POI_CKBN_HSP_KKD            @"HSP_KKD"
#define POI_CKBN_LCF_ADEOS          @"LCF_ADEOS"
#define POI_CKBN_DCM_IDSHOP         @"DCM_IDSHOP"
#define POI_CKBN_BET_HP             @"BET_HP"
#define POI_CKBN_GS_GOGO            @"GS_GOGO"
#define POI_CKBN_GS_ZPOI            @"GS_ZPOI"
#define POI_CKBN_PPK_ZPOI           @"PPK_ZPOI"
#define POI_CKBN_PPK_ZCOIN          @"PPK_ZCOIN"
#define POI_CKBN_PPK_PARK           @"PPK_PARK"
#define POI_CKBN_PPK_REPARK         @"PPK_REPARK"
#define POI_CKBN_PPK_MKS2           @"PPK_MKS2"
#define POI_CKBN_RS_ZPOI            @"RS_ZPOI"
#define POI_CKBN_BIDX_EKI           @"BIDX_EKI"
#define POI_CKBN_ZIDX_BLD           @"ZIDX_BLD"
#define POI_CKBN_BIDX_BLD           @"BIDX_BLD"
#define POI_CKBN_ADDR               @"ADDR"
#define POI_CKBN_ZIP                @"ZIP"
#define POI_CKBN_KOKO               @"KOKO"
#define POI_CKBN_BIDX_DCM           @"BIDX_DCM"
#define POI_CKBN_GRM_TBLOG          @"GRM_TBLOG"
#define POI_CKBN_KNK_ZPOI           @"KNK_ZPOI"
#define POI_CKBN_KNK_POI            @"KNK_POI"
#define POI_CKBN_RTC_RKT            @"RTC_RKT"
#define POI_CKBN_HTL_RKT            @"HTL_RKT"
#define POI_CKBN_HTL_JALAN          @"HTL_JALAN"
#define POI_CKBN_DCM_WIFI           @"DCM_WIFI"
#define POI_CKBN_TV_WIRE            @"TV_WIRE"
#define POI_CKBN_TV_LOCG            @"TV_LOCG"
#define POI_CKBN_BIDX_TWN           @"BIDX_TWN"
#define POI_CKBN_BIDX_ZPOI          @"BIDX_ZPOI"
#define POI_CKBN_GRM_GNAVI          @"GRM_GNAVI"
#define POI_CKBN_GRM_HP             @"GRM_HP"
#define POI_CKBN_BUSSTOP            @"BUSSTOP"
#define POI_CKBN_REG                @"REG"
//add by zhang_linhua for IN012 20140819 begin
#define POI_CKBN_DIDX_DKE           @"DIDX_DKE"
#define POI_CKBN_DIDX_EKI           @"DIDX_EKI"
#define POI_CKBN_DIDX_ZPOI          @"DIDX_ZPOI"
//add by zhang_linhua for IN012 20140819 end
//modify by zhang_jing for QA_0170017 20141009 begin
#define POI_CKBN_HOME               @"HOME"
//modify by zhang_jing for QA_0170017 20141009 end

// Table Name
#define kTablePoi                       @"Poi"
#define kTablePoiFavourite              @"PoiFavourite"
#define kTableGroup                     @"GroupPoi"
#define kTableRoute                     @"Route"
#define kTableNode                      @"Node"
#define kTableNavi                      @"Navi"

//Db Data Type
#define COUNT_                          @"COUNT(*)"
#define TEXT_                           @"TEXT"
#define INTEGER_                        @"INTEGER"
#define LONG_                           @"LONG"
#define PRIMARY_KEY_AUTOINCREMENT_      @"PRIMARY KEY AUTOINCREMENT"

//Db Local key - value
#define kNearalarm                      @"nearalarm_flg"
#define kOnmap                          @"onmap_flg"
#define kCkbn                           @"ckbn"
#define kComment                        @"comment"
#define kFavourite                      @"isFavourite"
#define FAVOURITE                       @"1"
#define kAccessDate                     @"accessDate"

//Api Input Params
#define TOKYO                           @"TOKYO"
#define T_                              @"T"
#define kRadius_3                       @"3000"
#define kRadius_10                      @"10000"

//Group Params
#define kCount                          @"count"
#define kGName                          @"groupName"
#define kGId                            @"groupId"
#define kGroupNameUnknow                @"グループなし"
#define kGroupNameTemplate              @"グループ%d"
// POI params value
#define kLimitFormat                    @"%d,%d"
#define kPageSize                       20
// POI params
#define kAddrCode                       @"addrcode"
#define kPId                            @"pId"
#define kId                             @"id"
#define kLocalId                        @"localId"
#define kWord                           @"word"
#define kDatum                          @"datum"
#define kAddCode                        @"addrcore"
#define kGenreCode                      @"genrecode"
#define kLimit                          @"limit"
#define kSrchyData                      @"srchdata"
#define kSrchyType                      @"srchtype"
#define kMLanguage                      @"mLanguage"
#define kDataset                        @"dataset"

#define kStatusCode                     @"status"
#define kStatusCodeSuccess              @"0000"
#define kStatusCodeTimeout              @"0001"
#define kInfo                           @"info"
#define kItem                           @"item"
#define kPhoneNumber                    @"phonenumber"

#define kText                           @"text"
#define kName                           @"name"
#define kCode                           @"code"
#define kPoint                          @"point"
#define kKana                           @"kana"
#define kKanaParts                      @"kanaParts"
#define kAddressText                    @"addressText"
#define kZipcode                        @"zipcode"
#define kAddr                           @"addr"
#define kAddress                        @"address"
#define kLatLon                         @"latlon"
#define kGnrnm                          @"gnrnm"
#define kTelno                          @"telno"
#define kDistance                       @"distance"
#define kResultPhoneNumber              @"phoneNumber"
#define kGenre                          @"genre"
#define kGenreMlang                     @"genreMlang"
#define kDetail                         @"detail"
#define kLanguage                       @"language"
#define kMLanguage                      @"mLanguage"
#define kAddressParts                   @"addressParts"
#define kEnd                            @"end"
#define kLevel                          @"level"
#define kBounds                         @"bounds"
#define kHit                            @"hit"
#define kKeyWord                        @"keyword"
#define kLat                            @"lat"
#define kLon                            @"lon"
#define kLng                            @"lng"
#define kParts                          @"parts"
#define kFacet                          @"facet"
#define kUrl                            @"url"
#define kChineseSupport                 @"chineseSupport"
#define kCard                           @"card"
#define kGCard                          @"gCard"
#define kSImgUrl                        @"sImgUrl"
#define kSImgCredit                     @"sImgCredit"
#define kLImg                           @"lImg"
#define kJP                             @"jp"
#define kHours                          @"hours"
#define kHoliday                        @"holiday"
#define kAccess                         @"access"
#define kCTCHCPY                        @"ctchcpy"
#define kIntro                          @"intro"
#define kPrice                          @"price"
#define kNozip                          @"_nozip"
#define kPoi                            @"poi"
#define kEki                            @"eki"
#define kRadius                         @"radius"
#endif /* ModelParamsDefine_h */

/*Define collumn name db*/
//Table Route
#define kRouteID                        @"route_id"
#define kNaviID                         @"navi_id"
#define kTime                           @"time"
#define kRouteType                      @"route_type"
#define kUse                            @"use"
#define kUseID                          @"use_id"
#define kTrainkey                       @"trainkey"
#define kTranscnt                       @"transcnt"
#define kRouteFlg                       @"route_flg"
#define kRouteFlgType                   @"route_flg_type"
#define kCarType                        @"car_type"
#define kFare                           @"fare"
#define kICExist                        @"ic_exist"
#define kICFare                         @"ic_fare"
#define kTotalTime                      @"total_time"
#define kDistance                       @"distance"
#define kStart                          @"start"
#define kGoal                           @"goal"
#define kTraffic                        @"traffic"
#define kIcons                          @"icons"
#define kNodes                          @"nodes"
#define kNode                           @"node"
#define kRouteName                      @"route_name"
#define kTimeStamp                      @"timestamp"
#define kFrameKbn                       @"frameKbn"
//Table Node

#define kNodeID                         @"node_id"
#define kNodeType                       @"node_type"
#define kNodeTypeID                     @"node_type_id"
#define kEnd                            @"end"
#define kRailkind                       @"railkind"
#define kLineNm                         @"linenm"
#define kTimeRide                       @"time_ride"
#define kTimeWait                       @"time_wait"
#define kJoin                           @"join"
#define kJoinDB                         @"join_db"
#define kStopcnt                        @"stopcnt"
#define kDirName                        @"dir_name"
#define kTTCD                           @"ttcd"
#define kTTDirCD                        @"tt_dir_cd"
#define kTTWeek                         @"tt_week"
#define kTTWeekID                       @"tt_week_id"
#define kColor                          @"color"
#define kImageID                        @"image_id"
#define kPlatformto                     @"platformto"
#define kTaxiInfo                       @"taxi_info"
#define kHighwayInfo                    @"highway_info"
#define kBikewayInfo                    @"bikeway_info"
#define kStopStation                    @"stop_station"

// Table Navi Info
#define kNaviID                         @"navi_id"
#define kNaviData                       @"navi_data"

//--------ngocdu DEFINE--------
#define japanLanguageCode  @"ja"
#define kantaiLanguageCode  @"zh-Hans-CN"
#define hantaiLanguageCode  @"zh-Hant-TW"
#define japanCode  @"ja"
#define kantaiCode  @"zh-Hans"
#define hantaiCode  @"zh-Hant"
#define englishLanguageCode             @"en"
#define defaultJapanLanguageCode        @"jp"

typedef enum
{
    TOD,
    SHK,
} AddressLevel;

#define kLevelList                      @[@"tod", @"shk"]
#define kLevelLangList                  @[@"todMlang", @"shkMlang"]

typedef NS_ENUM(NSInteger, SearchType) {
    //ngocdu
    SearchTypeNone,
    SearchTypeStation,
    SearchTypeShop,
    SearchTypeAddress,
    SearchTypePhoneNumber
};