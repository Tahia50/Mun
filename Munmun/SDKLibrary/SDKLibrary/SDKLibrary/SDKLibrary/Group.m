//
//  Group.m
//  SDKLibrary
//
//  Created by MrKien on 11/29/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "Group.h"
#import "ModelParamsDefine.h"
#import "DBManager.h"
#import "DbSchemaDefine.h"

@implementation Group


- (id) initWithName: (NSString*)name groupId: (NSNumber*) gId count : (NSNumber*)cnt {
    if (self = [super init]) {
        self.groupId = gId;
        self.groupName = name;
        self.count = cnt;
    }
    return self;
}

- (id) initWithDictionary: (id) dict {
    if (self = [super init]) {
        self.groupId = [dict objectForKey:kGId];
        self.groupName = [dict objectForKey:kGName];
        self.count = [dict objectForKey:kCount];
    }
    return self;
}

@end
