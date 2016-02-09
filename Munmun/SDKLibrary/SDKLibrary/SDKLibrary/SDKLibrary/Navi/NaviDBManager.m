//
//  NaviDBManager.m
//  SDKLibrary
//
//  Created by  on 12/18/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "NaviDBManager.h"
#import "NaviResult.h"
#import "Libs.h"
#import "DBManager.h"

@implementation NaviDBManager

+ (BOOL)hasItemNavi:(NaviResult *)navi {
    if (!navi.navi_id) {
        return NO;
    }
    return [DBManager hasItem:kSchemaCheckNavi withConditionval:[NSString stringWithFormat:@"%ld", navi.navi_id]];
}

+ (NSNumber *)totalNavi {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectCountNavi];
    if (!results || results.count == 0) {
        return [NSNumber numberWithInteger:0];
    }
    NSDictionary *obj = [results objectAtIndex:0];
    results = nil;
    return [obj objectForKey:COUNT_];
}

//+ (NaviDB *)getFirstNavi {
//    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectFirstRoute];
//    if (!results || results.count == 0) {
//        return nil;
//    }
//    return [[RouteResult alloc] initWithItem:results[0]];
//}

+ (BOOL)insertNavi:(NaviResult *)navi {
    NSArray *keys = kNaviCollumns;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        id obj = [navi valueForKey:key];
        if (!obj || [obj isKindOfClass:[NSNull class]]) {
            obj = @"";
        } else {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                obj = [Libs convertDictionaryToString:obj];
            } else if ([obj isKindOfClass:[NSArray class]]) {
                NSMutableArray *array = [NSMutableArray new];
                for (id item in obj) {
                    if ([item isKindOfClass:[NSDictionary class]]) {
                        [array addObject:[Libs convertDictionaryToString:item]];
                    }
                }
                obj = [[array valueForKey:@"description"] componentsJoinedByString:@";"];
            }
        }
        [vals addObject:obj];
    }
    [DBManager executeUpdateAndGetLastID:kSchemaInsertNavi withArgumens:vals];
    return YES;
}

+ (BOOL)updateNavi:(NaviResult *)navi {
    NSArray *keys = kNaviCollumns;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        [vals addObject:[navi valueForKey:key]];
    }
    [vals addObject:[navi valueForKey:kId]];
    return [DBManager executeUpdate:kSchemaUpdateNavi withArgumens:vals];
}

+ (BOOL)insertOrUpdateNavi:(NaviResult *)navi {
    if ([self hasItemNavi:navi]) {
        return [self updateNavi:navi];
    } else {
        return [self insertNavi:navi];
    }
}

+ (BOOL)requestDeleteNaviByRouteID:(NSNumber*)route_id {
    NSMutableArray *vals = [NSMutableArray array];
    [vals addObject:route_id];
    return [DBManager executeUpdate:kSchemaDeleteNavi withArgumens:vals];
}

+ (void)requestListNaviWithRoute:(NSInteger)route_id completion:(void (^)(id response))complete {
    NSMutableArray *results = [DBManager executeQuerry:kSelectNaviByRoute withConditionval:[NSArray arrayWithObjects:[NSNumber numberWithInteger:route_id], nil]];
    if (results.count > 0) {
        complete (results[0]);
    } else {
        complete(nil);
    }
    
}

+ (BOOL)saveNaviData:(NSDictionary *)data route_id:(NSInteger)route_id {
    NSDictionary *dict = @{kNaviData:data, kRouteID:[NSNumber numberWithInteger:route_id]};
    NaviResult *db = [[NaviResult alloc] initWithObject:dict];
    return [self insertOrUpdateNavi:db];
}

@end
