//
//  NaviDB.m
//  SDKLibrary
//
//  Created by  on 12/18/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "NaviResult.h"
#import "DbSchemaDefine.h"
#import "Libs.h"

@implementation NaviResult
- (id)initWithObject:(id)obj {
    if (self = [super init]) {
        self.navi_id = [[obj objectForKey:kId] integerValue];
        self.route_id = [[obj objectForKey:kRouteID] integerValue];
        id navi_data = [obj objectForKey:kNaviData];
        if ([navi_data isKindOfClass:[NSString class]]) {
            self.navi_data = [Libs convertStringToDictionary:navi_data];
        } else {
            self.navi_data = navi_data;
        }
    }
    return self;
}
@end
