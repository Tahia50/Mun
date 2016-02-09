//
//  DbSchemaDefine.h
//  SDKLibrary
//
//  Created by MrKien on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelParamsDefine.h"

//Template querry
#define VALUES                                      @"VALUES"
#define WHERE                                       @"WHERE"
#define kBaseCreate                                 @"Create Table if not exists %@ ("
#define kSelectAllFavourite                         @"SELECT * FROM PoiFavourite Left Outer Join GroupPoi ON PoiFavourite.groupId = GroupPoi.groupId ORDER BY %@ DESC"
#define kSelectAll                                  @"Select * from %@ "
#define kSelectAllOrder                             @"Select * from %@ ORDER BY %@ DESC"
#define kSelectLiMit                                @"LIMIT %d OFFSET %ld"
#define kDeleteCondition                            @"DELETE FROM %@ WHERE %@ = ?"
#define kSelectConditionFavourite                   @"SELECT * FROM PoiFavourite Left Outer Join GroupPoi ON PoiFavourite.groupId = GroupPoi.groupId where %@ = ? ORDER BY %@ DESC"
#define kSelectAllRoute                             @"SELECT * FROM Route ORDER BY timestamp DESC"
#define kSelectNaviByRoute                          @"SELECT * FROM Navi where route_id = ? ORDER BY id DESC"

#define kSelectCondition                            @"Select * from %@ where %@ = ?"
#define kSelectFirstCondition                       @"Select * from %@ ORDER BY %@ ASC LIMIT 1"
#define kSelectLastCondition                        @"Select * from %@ ORDER BY %@ DESC LIMIT 1"
#define kSelectCountCondition                       @"Select COUNT(*) from %@"
#define kBaseInseart                                @"INSERT INTO %@ ("
#define kBaseUpdate                                 @"UPDATE  %@ SET "
#define kBaseInseartValues                          @"(%@)"
#define kInsertFieldFormat                          @"%@ %@, "
#define kInsertLastFieldFormat                      @"%@ %@ %@)"
#define kSelectGroupWithCountTemplate               @"SELECT %@ FROM GroupPoi Left Outer Join PoiFavourite ON GroupPoi.groupId = PoiFavourite.groupId Group By GroupPoi.groupId"
#define kSelectNodeByRouteID                        @"SELECT * FROM Node WHERE route_id = ? ORDER BY %@ ASC"


//delete
#define kSchemaDeletePoi                            ([DbSchemaDefine schemaDeletePoi])
#define kSchemaDeletePoiFavourite                   ([DbSchemaDefine schemaDeletePoiFavourite])
#define kSchemaDeleteRoute                          ([DbSchemaDefine schemaDeleteRoute])
#define kSchemaDeleteNavi                           ([DbSchemaDefine schemaDeleteNavi])

//create table
#define kSchemaCreateTablePoi                       ([DbSchemaDefine schemaCreateTablePoi])
#define kSchemaCreateTableGroup                     ([DbSchemaDefine schemaCreateTableGroup])
#define kSchemaCreateTablePoiFavourite              ([DbSchemaDefine schemaCreateTablePoiFavourite])
#define kSchemaCreateTableRoute                     ([DbSchemaDefine schemaCreateTableRoute])
#define kSchemaCreateTableNaviDB                    ([DbSchemaDefine schemaCreateTableNaviDB])

//select
#define kSchemaSelectPoi                            ([DbSchemaDefine schemaSelectPoi])
#define kSchemaSelectGroup                          ([DbSchemaDefine schemaSelectGroup])
#define kSchemaSelectGroupCount                     ([DbSchemaDefine schemaSelectGroupCount])
#define kSchemaSelectPoiFavourite                   ([DbSchemaDefine schemaSelectPoiFavourite])
#define kSchemaSelectPoiFavouriteByGroup            ([DbSchemaDefine schemaSelectPoiFavouriteByGroup])
#define kSchemaSelectFirstPoiFavourite              ([DbSchemaDefine schemaSelectFirstPoiFavourite])
#define kSchemaSelectLastPoiFavourite               ([DbSchemaDefine schemaSelectLastPoiFavourite])
#define kSchemaSelectFirstPoi                       ([DbSchemaDefine schemaSelectFirstPoi])
#define kSchemaSelectFirstRoute                     ([DbSchemaDefine schemaSelectFirstRoute])
#define kSchemaSelectLastRoute                      ([DbSchemaDefine schemaSelectLastRoute])
#define kSchemaSelectRoute                          ([DbSchemaDefine schemaSelectRoute])

//create check item
#define kSchemaCheckGroup                           ([DbSchemaDefine schemaCheckGroup])
#define kSchemaCheckPoi                             ([DbSchemaDefine schemaCheckPoi])
#define kSchemaCheckPoiFavourite                    ([DbSchemaDefine schemaCheckPoiFavourite])
#define kSchemaSelectPoiFavouriteByCode             ([DbSchemaDefine schemaGetPoiFavouriteByCode])
#define kSchemaCheckRoute                           ([DbSchemaDefine schemaCheckRoute])
#define kSchemaCheckNavi                            ([DbSchemaDefine schemaCheckNavi])

//update table
#define kSchemaUpdatePoi                            ([DbSchemaDefine schemaUpdatePoi])
#define kSchemaUpdateGroup                          ([DbSchemaDefine schemaUpdateGroup])
#define kSchemaUpdatePoiFavourite                   ([DbSchemaDefine schemaUpdatePoiFavourite])
#define kSchemaUpdateRoute                          ([DbSchemaDefine schemaUpdateRoute])
#define kSchemaUpdateNavi                           ([DbSchemaDefine schemaUpdateNavi])

//instert table
#define kSchemaInsertPoi                            ([DbSchemaDefine schemaInsertPoi])
#define kSchemaInsertGroup                          ([DbSchemaDefine schemaInsertGroup])
#define kSchemaInsertPoiFavourite                   ([DbSchemaDefine schemaInsertPoiFavourite])
#define kSchemaInsertRoute                          ([DbSchemaDefine schemaInsertRoute])
#define kSchemaInsertNavi                           ([DbSchemaDefine schemaInsertNavi])

//select count
#define kSchemaSelectCountFavourite                 ([DbSchemaDefine schemaSelectCountFavourite])
#define kSchemaSelectCountHistory                   ([DbSchemaDefine schemaSelectCountHistory])
#define kSchemaSelectCountRoute                     ([DbSchemaDefine schemaSelectCountRoute])
#define kSchemaSelectCountNavi                      ([DbSchemaDefine schemaSelectCountNavi])

#define kPoiCollums                                 @[kName, kLat, kCode, kLon, kAddr, kGenre, kTelno, kDistance, kAccessDate]
#define kPoiUpdateCollums                           @[kName, kLat, kCode, kLon, kAddr, kGenre, kTelno, kDistance, kAccessDate]
#define kGroupCollum                                @[kGName, kGId]
#define kGroupUpdateCollum                          @[kGName]
#define kPoiFavouriteCollums                        @[kName, kLat, kCode, kLon, kAddr, kGenre, kTelno, kDistance, kAccessDate, kFavourite, kNearalarm, kOnmap, kCkbn, kComment, kGId]
#define kFavouriteUpdateCollum                      @[kName, kLat, kCode, kLon, kAddr, kGenre, kTelno, kDistance, kAccessDate, kFavourite, kNearalarm, kOnmap, kCkbn, kComment, kGId]
#define kRouteCollumns                               @[kNaviID, kRouteType, kTime, kUse, kUseID, kTrainkey, kTranscnt, kRouteFlg, kRouteFlgType, kCarType, kFare, kICExist, kICFare, kTotalTime, kDistance, kStart, kGoal, kTraffic, kIcons, kRouteName, kTimeStamp, kNodes]
#define kNaviCollumns                               @[kRouteID, kNaviData]

@interface DbSchemaDefine : NSObject

+(NSString*) schemaCreateTablePoi;
+(NSString*) schemaCreateTablePoiFavourite;
+(NSString*) schemaCreateTableGroup;
+(NSString*) schemaSelectPoi;
+(NSString*) schemaSelectGroup;
+(NSString*) schemaSelectGroupCount;
+(NSString*) schemaSelectPoiFavourite;
+(NSString*) schemaSelectFirstPoi;
+(NSString*) schemaSelectFirstPoiFavourite;
+(NSString*) schemaSelectLastPoiFavourite;
+(NSString*) schemaCheckGroup;
+(NSString*) schemaCheckPoi;
+(NSString*) schemaCheckPoiFavourite;
+(NSString*) schemaGetPoiFavouriteByCode;
+(NSString*) schemaDeletePoi;
+(NSString*) schemaDeletePoiFavourite;
+(NSString*) schemaSelectPoiFavouriteByGroup;
+(NSString*) schemaInsertPoi;
+(NSString*) schemaInsertGroup;
+(NSString*) schemaInsertPoiFavourite;
+(NSString*) schemaUpdatePoiFavourite;
+(NSString*) schemaUpdatePoi;
+(NSString*) schemaUpdateGroup;
+(NSString*) schemaSelectCountFavourite;
+(NSString*) schemaSelectCountHistory;
+(NSString*) schemaInsertTable: (NSString*)tableName collumns: (NSArray*)collumns;
+(NSString*) schemaBaseUpdateField: (NSString*)tableName collumns: (NSArray*)collumns conditionKey:(NSString *)key;
+(NSString*) schemaUpdatePoiWithconditionKey:(NSString *)key collumns: (NSArray*)collumns;
+ (NSString *)schemaCheckRoute;
+ (NSString *)schemaCreateTableRoute;
+ (NSString *)schemaInsertRoute;
+ (NSString *)schemaUpdateRouteWithconditionKey:(NSString *)key collumns:(NSArray *)collumns;
+ (NSString *)schemaUpdateNodeWithconditionKey:(NSString *)key collumns:(NSArray *)collumns;
+ (NSString *)schemaUpdateRoute;
+ (NSString *)schemaSelectCountRoute;
+ (NSString *)schemaSelectLastRoute;
+ (NSString *)schemaSelectFirstRoute;
+ (NSString *)schemaDeleteRoute;
+ (NSString *)schemaSelectRoute;
+ (NSString *)schemaCheckNavi;
+ (NSString *)schemaSelectCountNavi;
+ (NSString *)schemaInsertNavi;
+ (NSString *)schemaUpdateNavi;
+ (NSString *)schemaCreateTableNaviDB;
+ (NSString *)schemaDeleteNavi;

@end
