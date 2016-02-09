//
//  GroupManager.h
//  SDKLibrary
//
//  Created by MrKien on 11/29/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelParamsDefine.h"
#import "Group.h"

@interface GroupManager : NSObject

+ (void)insertOrUpdateGroup: (Group*) group;
+ (BOOL) hasItem: (Group*) group;
+ (void)insertGroup:(Group*)group;
+ (void)updateGroup: (Group *)group;
+ (Group*)groupById: (NSNumber*)gId;
+ (void)initGroups;
+ (NSMutableArray*)allGroups;
+ (NSMutableArray*)allGroupsWithCount;

@end
