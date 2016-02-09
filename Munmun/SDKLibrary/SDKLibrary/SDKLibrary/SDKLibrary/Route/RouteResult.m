//
//  RouteResult.m
//  SDKLibrary
//
//  Created by  on 12/11/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "RouteResult.h"
#import "DbSchemaDefine.h"
#import "Libs.h"

@implementation RouteResult

- (id)initWithItem:(NSDictionary *)obj {
    if (self = [self init]) {
        self.route_id = [[obj objectForKey:kId] integerValue];
        if ([obj objectForKey:kNaviID]) {
            self.navi_id = [obj objectForKey:kNaviID];
        } else {
            self.navi_id = [obj objectForKey:@"naviid"];
        }
        self.route_type = [obj objectForKey:kRouteType];
        id timeObj = [obj objectForKey:kTime];
        if ([timeObj isKindOfClass:[NSDictionary class]]) {
            self.time = timeObj;
        } else if ([timeObj isKindOfClass:[NSString class]]){
            self.time = [Libs convertStringToDictionary:timeObj];
        }
        self.use = [obj objectForKey:kUse];
        self.use_id = [obj objectForKey:kUseID];
        self.trainkey = [obj objectForKey:kTrainkey];
        self.transcnt = [obj objectForKey:kTranscnt];
        self.route_flg = [obj objectForKey:kRouteFlg];
        self.route_flg_type = [obj objectForKey:kRouteFlgType];
        self.car_type = [obj objectForKey:kCarType];
        self.fare = [obj objectForKey:kFare];
        self.ic_exist = [obj objectForKey:kICExist];
        self.ic_fare = [obj objectForKey:kICFare];
        self.total_time = [obj objectForKey:kTotalTime];
        self.distance = [obj objectForKey:kDistance];
        id startObj = [obj objectForKey:kStart];
        if ([startObj isKindOfClass:[NSDictionary class]]) {
            self.start = startObj;
        } else if ([startObj isKindOfClass:[NSString class]]) {
            self.start = [Libs convertStringToDictionary:startObj];
        }
        id goalObj = [obj objectForKey:kGoal];
        if ([goalObj isKindOfClass:[NSDictionary class]]) {
            self.goal = goalObj;
        } else if ([goalObj isKindOfClass:[NSString class]]) {
            self.goal = [Libs convertStringToDictionary:goalObj];
        }
        self.traffic = [obj objectForKey:kTraffic];
        id iconObj = [obj objectForKey:kIcons];
        if ([iconObj isKindOfClass:[NSArray class]]) {
            self.icons = iconObj;
        } else if ([iconObj isKindOfClass:[NSString class]]) {
            NSMutableArray *iconArray = [NSMutableArray new];
            NSArray *array = [iconObj componentsSeparatedByString:@";"];
            for (id item in array) {
                NSDictionary *subDict = [Libs convertStringToDictionary:item];
                if (subDict) {
                    [iconArray addObject:subDict];
                }
            }
            self.icons = [iconArray mutableCopy];
        }
        id nodes = [obj objectForKey:kNodes];
        if ([nodes isKindOfClass:[NSDictionary  class]]) {
            self.nodes = nodes;
        } else if ([nodes isKindOfClass:[NSString class]]) {
            self.nodes = [Libs convertStringToDictionary:nodes];
        }
        self.frameKbn = [obj objectForKey:kFrameKbn];
    }
    return self;
}

@end
