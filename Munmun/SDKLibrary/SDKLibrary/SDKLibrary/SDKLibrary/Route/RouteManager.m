//
//  RouteManager.m
//  SDKLibrary
//
//  Created by  on 12/11/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "RouteManager.h"
#import "DBManager.h"
#import "Libs.h"
#import "NaviDBManager.h"

@implementation RouteManager

+ (BOOL)hasItemRoute:(RouteResult *)route {
    if (!route.route_id) {
        return NO;
    }
    return [DBManager hasItem:kSchemaCheckRoute withConditionval:[NSString stringWithFormat:@"%ld", route.route_id]];
}

+ (NSNumber *)totalRoute {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectCountRoute];
    if (!results || results.count == 0) {
        return [NSNumber numberWithInteger:0];
    }
    NSDictionary *obj = [results objectAtIndex:0];
    results = nil;
    return [obj objectForKey:COUNT_];
}

+ (RouteResult *)getFirstRoute {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectFirstRoute];
    if (!results || results.count == 0) {
        return nil;
    }
    return [[RouteResult alloc] initWithItem:results[0]];
}

+ (NSInteger)insertRoute:(RouteResult *)route {
    NSNumber *count = [RouteManager totalRoute];
    if ([count integerValue] >= kLimitRoute) {
        RouteResult *firstRoute = [RouteManager getFirstRoute];
        [RouteManager requestDeleteRoute:[NSNumber numberWithInteger:firstRoute.route_id]];
        firstRoute = nil;
    }
    NSArray *keys = kRouteCollumns;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        id obj = [route valueForKey:key];
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
    return [DBManager executeUpdateAndGetLastID:kSchemaInsertRoute withArgumens:vals];
}

+ (BOOL)updateRoute:(RouteResult *)route {
    NSArray *keys = kRouteCollumns;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        id obj = [route valueForKey:key];
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
    [vals addObject:[NSNumber numberWithInteger:route.route_id]];
    return [DBManager executeUpdate:kSchemaUpdateRoute withArgumens:vals];
}

+ (NSInteger)insertOrUpdateRoute:(RouteResult *)route {
    if ([self hasItemRoute:route]) {
        return [self updateRoute:route];
    } else {
        return [self insertRoute:route];
    }
}

+ (BOOL)requestDeleteRoute:(NSNumber*)rId {
    NSMutableArray *vals = [NSMutableArray array];
    [vals addObject:rId];
    BOOL ok = [NaviDBManager requestDeleteNaviByRouteID:rId];
    if (!ok) {
        return ok;
    }
    return [DBManager executeUpdate:kSchemaDeleteRoute withArgumens:vals];
}

+ (void)requestListRouteWithcompletion:(void (^)(id response))complete {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectRoute withConditionval:nil];
    complete (results);
}

+ (NSInteger)saveRootWithRoute:(NSDictionary *)routeData {
    NSArray *tabsArray = [[routeData objectForKey:@"body"] objectForKey:@"tabs"];
    for (NSDictionary *dict in tabsArray) {
        for (NSDictionary *routeDict in [dict objectForKey:@"route_list"]) {
            RouteResult *routeModel = [[RouteResult alloc] initWithItem:routeDict];
            NSInteger ok = [RouteManager insertOrUpdateRoute:routeModel];
            if (ok) {
                return ok;
            }
        }
    }
    return NO;
}

+ (NSInteger)saveRouteWithObject:(id)routeObj routeName:(NSString *)route_name {
    if ([routeObj isKindOfClass:[RouteResult class]]) {\
        RouteResult *routeModel =   (RouteResult*)routeObj;
        routeModel.route_name = route_name;
        routeModel.timestamp = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
        return [RouteManager insertOrUpdateRoute:routeObj];
    }
    RouteResult *routeModel = [[RouteResult alloc] initWithItem:routeObj];
    routeModel.route_name = route_name;
    routeModel.timestamp = [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
    return [RouteManager insertOrUpdateRoute:routeModel];
}

@end
