//
//  DbSchemaDefine.m
//  SDKLibrary
//
//  Created by MrKien on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DbSchemaDefine.h"

@implementation DbSchemaDefine

+ (NSString*)schemaCreateTablePoi {
    NSString *schema = [NSString stringWithFormat:kBaseCreate,kTablePoi];
    NSMutableArray *collumns = [NSMutableArray array];
    NSMutableArray *databaseColumns = [[NSMutableArray alloc] init];
    [databaseColumns addObjectsFromArray:kPoiCollums];
    for (NSString *collumn in databaseColumns) {
        if ([collumn isEqualToString:kFavourite] || [collumn isEqualToString:kNearalarm] || [collumn isEqualToString:kOnmap]
            || [collumn isEqualToString:kGId]) {
            [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat,collumn,INTEGER_]];
            continue;
        }
        [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat,collumn,TEXT_]];
    }
    [collumns addObject:[NSString stringWithFormat:kInsertLastFieldFormat, kId ,INTEGER_, PRIMARY_KEY_AUTOINCREMENT_]];
    for (NSString *collumn in collumns) {
        schema = [NSString stringWithFormat:@"%@%@",schema,collumn];
    }
    return schema;
}

+(NSString*) schemaCreateTablePoiFavourite {
    NSString *schema = [NSString stringWithFormat:kBaseCreate,kTablePoiFavourite];
    NSMutableArray *collumns = [NSMutableArray array];
    NSMutableArray *databaseColumns = [[NSMutableArray alloc] init];
    [databaseColumns addObjectsFromArray:kPoiFavouriteCollums];
    for (NSString *collumn in databaseColumns) {
        if ([collumn isEqualToString:kFavourite] || [collumn isEqualToString:kNearalarm] || [collumn isEqualToString:kOnmap]
            || [collumn isEqualToString:kGId]) {
            [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat,collumn,INTEGER_]];
            continue;
        }
        [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat,collumn,TEXT_]];
    }
    [collumns addObject:[NSString stringWithFormat:kInsertLastFieldFormat, kId ,INTEGER_, PRIMARY_KEY_AUTOINCREMENT_]];
    for (NSString *collumn in collumns) {
        schema = [NSString stringWithFormat:@"%@%@",schema,collumn];
    }
    return schema;
}

+ (NSString *)schemaCreateTableGroup {
    NSString *schema = [NSString stringWithFormat:kBaseCreate,kTableGroup];
    NSMutableArray *collumns = [NSMutableArray array];
    [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat, kGName, TEXT_]];
    [collumns addObject:[NSString stringWithFormat:kInsertLastFieldFormat, kGId, INTEGER_,@""]];
    for (NSString *collumn in collumns) {
        schema = [NSString stringWithFormat:@"%@%@",schema,collumn];
    }
    return schema;
}

+ (NSString*)schemaSelectPoi {
    return [NSString stringWithFormat:kSelectAllOrder,kTablePoi,kAccessDate];
}

+(NSString*) schemaSelectGroup {
    return [NSString stringWithFormat:kSelectAll,kTableGroup];
}

+(NSString*) schemaSelectGroupCount {
    NSString *fields = @"";
    for (NSString *collumn in kGroupCollum) {
        if ([kGroupCollum indexOfObject:collumn] == 0) {
            fields = [NSString stringWithFormat:@"%@GroupPoi.%@",fields,collumn];
            continue;
        }
        fields = [NSString stringWithFormat:@"%@,GroupPoi.%@",fields,collumn];
    }
    fields = [NSString stringWithFormat:@"%@, Count(PoiFavourite.code) As %@",fields,kCount];
    NSString *schema = [NSString stringWithFormat:kSelectGroupWithCountTemplate,fields];
    return schema;
}

+ (NSString*)schemaSelectPoiFavourite {
    return [NSString stringWithFormat:kSelectAllFavourite,kAccessDate];
}

+ (NSString*) schemaSelectFirstPoi {
    return [NSString stringWithFormat:kSelectFirstCondition,kTablePoi,kAccessDate];
}

+ (NSString*) schemaSelectFirstPoiFavourite {
    return [NSString stringWithFormat:kSelectFirstCondition,kTablePoiFavourite,kAccessDate];
}

+ (NSString*) schemaSelectLastPoiFavourite {
    return [NSString stringWithFormat:kSelectLastCondition,kTablePoiFavourite,kAccessDate];
}

+ (NSString*) schemaSelectPoiFavouriteByGroup {
    return [NSString stringWithFormat:kSelectCondition,kTablePoiFavourite,kGId];
}

+ (NSString*) schemaCheckPoi {
    return [NSString stringWithFormat:kSelectCondition,kTablePoi,kCode];
}

+ (NSString*) schemaCheckGroup {
    return [NSString stringWithFormat:kSelectCondition,kTableGroup,kGId];
}

+ (NSString*) schemaCheckPoiFavourite {
    return [NSString stringWithFormat:kSelectCondition,kTablePoiFavourite,kId];
}

+ (NSString*) schemaGetPoiFavouriteByCode {
    return [NSString stringWithFormat:kSelectConditionFavourite,kId,kAccessDate];
}

+ (NSString*)schemaSelectCountFavourite {
    return [NSString stringWithFormat:kSelectCountCondition,kTablePoiFavourite];
}

+ (NSString*)schemaSelectCountHistory {
    return [NSString stringWithFormat:kSelectCountCondition,kTablePoi];
}

+(NSString*) schemaDeletePoi{
    return [NSString stringWithFormat:kDeleteCondition,kTablePoi,kCode];
}

+(NSString*) schemaDeletePoiFavourite{
    return [NSString stringWithFormat:kDeleteCondition,kTablePoiFavourite,kId];
}

+ (NSString*) schemaUpdatePoiFavourite{
    return [DbSchemaDefine schemaUpdatePoiFavouriteWithconditionKey:kId collumns:kPoiFavouriteCollums];
}

+ (NSString*) schemaUpdatePoi {
    return [DbSchemaDefine schemaUpdatePoiWithconditionKey:kCode collumns:kPoiCollums];
}

+ (NSString*) schemaUpdateGroup {
    return [DbSchemaDefine schemaUpdateGroupWithconditionKey:kGId collumns:kGroupCollum];
}


+ (NSString*)schemaInsertPoi {
    return [DbSchemaDefine schemaInsertTable:kTablePoi collumns:kPoiCollums];
}

+ (NSString*)schemaInsertPoiFavourite {
    return [DbSchemaDefine schemaInsertTable:kTablePoiFavourite collumns:kPoiFavouriteCollums];
}

+ (NSString*)schemaInsertGroup {
    return [DbSchemaDefine schemaInsertTable:kTableGroup collumns:kGroupCollum];
}

+ (NSString*)schemaUpdatePoiWithconditionKey:(NSString *)key collumns: (NSArray*)collumns {
    NSString *schema = [DbSchemaDefine schemaBaseUpdateField:kTablePoi collumns:collumns conditionKey:key];
    return schema;
}

+ (NSString*)schemaUpdatePoiFavouriteWithconditionKey:(NSString *)key collumns: (NSArray*)collumns {
    NSString *schema = [DbSchemaDefine schemaBaseUpdateField:kTablePoiFavourite collumns:collumns conditionKey:key];
    return schema;
}

+ (NSString*)schemaUpdateGroupWithconditionKey:(NSString *)key collumns: (NSArray*)collumns {
    NSString *schema = [DbSchemaDefine schemaBaseUpdateField:kTableGroup collumns:collumns conditionKey:key];
    return schema;
}

+ (NSString *)schemaUpdateRouteWithconditionKey:(NSString *)key collumns:(NSArray *)collumns {
    NSString *schema = [DbSchemaDefine schemaBaseUpdateField:kTableRoute collumns:collumns conditionKey:key];
    return schema;
}

+ (NSString*) schemaInsertTable: (NSString*)tableName collumns: (NSArray*)collumns {
    NSString *schema = [NSString stringWithFormat:kBaseInseart,tableName];
    NSString *values = [[NSString alloc] init];
    for (NSString *collumn in collumns) {
        if ([collumns indexOfObject:collumn] == 0) {
            schema = [NSString stringWithFormat:@"%@%@",schema,collumn];
            values = [NSString stringWithFormat:@"%@%@",values,@"?"];
            continue;
        }
        schema = [NSString stringWithFormat:@"%@,%@",schema,collumn];
        values = [NSString stringWithFormat:@"%@%@",values,@",?"];
    }
    values = [NSString stringWithFormat:kBaseInseartValues,values];
    schema = [NSString stringWithFormat:@"%@ %@ %@ %@",schema,@")",VALUES,values];
    values = nil;
    return schema;
}

+ (NSString*)schemaBaseUpdateField: (NSString*)tableName collumns: (NSArray*)collumns conditionKey:(NSString *)key {
    NSString *schema = [NSString stringWithFormat:kBaseUpdate,tableName];
    for (NSString *collumn in collumns) {
        if ([collumns indexOfObject:collumn] == 0) {
            schema = [NSString stringWithFormat:@"%@%@ = ?",schema,collumn];
            continue;
        }
        schema = [NSString stringWithFormat:@"%@,%@ = ?",schema,collumn];
    }
    schema = [NSString stringWithFormat:@"%@ %@ %@ = ?",schema, WHERE,key];
    return schema;
}

//doanhkisi
+ (NSString *)schemaCreateTableRoute {
    NSString *schema = [NSString stringWithFormat:kBaseCreate,kTableRoute];
    NSMutableArray *collumns = [NSMutableArray array];
    NSMutableArray *databaseColumns = [[NSMutableArray alloc] init];
    [databaseColumns addObjectsFromArray:kRouteCollumns];
    for (NSString *collumn in databaseColumns) {
        if ([collumn isEqualToString:kFavourite] || [collumn isEqualToString:kNearalarm] || [collumn isEqualToString:kOnmap]
            || [collumn isEqualToString:kGId] || [collumn isEqualToString:kRouteID]) {
            [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat,collumn,INTEGER_]];
            continue;
        }
        [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat,collumn,TEXT_]];
    }
    [collumns addObject:[NSString stringWithFormat:kInsertLastFieldFormat, kId ,INTEGER_, PRIMARY_KEY_AUTOINCREMENT_]];
    for (NSString *collumn in collumns) {
        schema = [NSString stringWithFormat:@"%@%@",schema,collumn];
    }
    return schema;
}

+ (NSString *)schemaCreateTableNaviDB {
    NSString *schema = [NSString stringWithFormat:kBaseCreate, kTableNavi];
    NSMutableArray *collumns = [NSMutableArray array];
    NSMutableArray *databaseColumns = [[NSMutableArray alloc] init];
    [databaseColumns addObjectsFromArray:kNaviCollumns];
    for (NSString *collumn in databaseColumns) {
        if ([collumn isEqualToString:kFavourite] || [collumn isEqualToString:kNearalarm] || [collumn isEqualToString:kOnmap]
            || [collumn isEqualToString:kGId] || [collumn isEqualToString:kRouteID]) {
            [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat,collumn,INTEGER_]];
            continue;
        }
        [collumns addObject:[NSString stringWithFormat:kInsertFieldFormat,collumn,TEXT_]];
    }
    [collumns addObject:[NSString stringWithFormat:kInsertLastFieldFormat, kId ,INTEGER_, PRIMARY_KEY_AUTOINCREMENT_]];
    for (NSString *collumn in collumns) {
        schema = [NSString stringWithFormat:@"%@%@",schema,collumn];
    }
    return schema;
}

+ (NSString *)schemaCheckRoute {
    return [NSString stringWithFormat:kSelectCondition, kTableRoute, kId];
}

+ (NSString *)schemaDeleteRoute {
    return [NSString stringWithFormat:kDeleteCondition, kTableRoute, kId];
}

+ (NSString *)schemaUpdateRoute {
    return [DbSchemaDefine schemaUpdateRouteWithconditionKey:kId collumns:kRouteCollumns];
}

+ (NSString *)schemaUpdateNavi {
    return [DbSchemaDefine schemaUpdateRouteWithconditionKey:kId collumns:kNaviCollumns];
}

+ (NSString *)schemaInsertRoute {
    return [DbSchemaDefine schemaInsertTable:kTableRoute collumns:kRouteCollumns];
}


+ (NSString *)schemaInsertNavi {
    return [DbSchemaDefine schemaInsertTable:kTableNavi collumns:kNaviCollumns];
}

+ (NSString *)schemaCheckNavi {
    return [NSString stringWithFormat:kSelectCondition, kTableNavi, kId];
}

+ (NSString *)schemaSelectLastRoute {
    return [NSString stringWithFormat:kSelectLastCondition, kTableRoute, kId];
}

+ (NSString *)schemaSelectFirstRoute {
    return [NSString stringWithFormat:kSelectFirstCondition, kTableRoute, kId];
}

+ (NSString *)schemaSelectRoute {
    return [NSString stringWithFormat:kSelectAllRoute];
}

+ (NSString *)schemaSelectCountRoute {
    return [NSString stringWithFormat:kSelectCountCondition, kTableRoute];
}

+ (NSString *)schemaSelectCountNavi {
    return [NSString stringWithFormat:kSelectCountCondition, kTableNavi];
}

+ (NSString *)schemaDeleteNavi {
    return [NSString stringWithFormat:kDeleteCondition, kTableNavi, kRouteID];
}
// end doanhkisi

@end
