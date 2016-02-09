//
//  GroupManager.m
//  SDKLibrary
//
//  Created by MrKien on 11/29/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "GroupManager.h"
#import "DBManager.h"
#import "DbSchemaDefine.h"


@implementation GroupManager

+ (void)initGroups {
    NSMutableArray *gArray = [[NSMutableArray alloc] init];
    Group *group = [[Group alloc] initWithName:kGroupNameUnknow groupId:[NSNumber numberWithInt:0] count:[NSNumber numberWithInteger:0]];
    [gArray addObject:group];
    for (int i = 1; i <=10; i++) {
        NSString *name = [NSString stringWithFormat:kGroupNameTemplate,i];
        group = [[Group alloc] initWithName:name groupId:[NSNumber numberWithInt:i] count:[NSNumber numberWithInteger:0]];
        [gArray addObject:group];
    }
    group = nil;
    for (int i = 0; i < [gArray count]; i++) {
        [GroupManager insertOrUpdateGroup:[gArray objectAtIndex:i]];
    }
    [gArray removeAllObjects];
    gArray = nil;
}

+ (void)insertOrUpdateGroup: (Group*) group {
    if ([GroupManager hasItem:group]) {
        [self updateGroup:group];
    }else{
        [self insertGroup:group];
    }
}

+ (BOOL) hasItem: (Group*) group {
    return [DBManager hasItem: kSchemaCheckGroup withConditionval: group.groupId];
}

+ (Group*)groupById: (NSNumber*)gId {
    Group *retVal = nil;
    NSMutableArray *results = [DBManager executeQuerry:kSchemaCheckGroup withConditionval:[NSArray arrayWithObject:gId]];
    if (results && results.count >0 ) {
        retVal = [[Group alloc] initWithDictionary:[results objectAtIndex:0]];
    }
    return retVal;
}

+ (void)insertGroup:(Group*)group {
    NSArray *keys = kGroupCollum;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        [vals addObject:[group valueForKey:key]];
    }
    [DBManager executeUpdate:kSchemaInsertGroup withArgumens:vals];
}

+ (void)updateGroup: (Group *)group {
    NSArray *keys = kGroupCollum;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        [vals addObject:[group valueForKey:key]];
    }
    [vals addObject:[group valueForKey:kGId]];
    [DBManager executeUpdate:kSchemaUpdateGroup withArgumens:vals];
}

+ (NSMutableArray*)allGroups {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectGroup];
    NSMutableArray *groups = [[NSMutableArray alloc] init];
    for (id result in results) {
        [groups addObject:[[Group alloc] initWithDictionary:result]];
    }
    return groups;
}

+ (NSMutableArray*)allGroupsWithCount {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectGroupCount];
    NSMutableArray *groups = [[NSMutableArray alloc] init];
    for (id result in results) {
        [groups addObject:[[Group alloc] initWithDictionary:result]];
    }
    return groups;
}

@end
