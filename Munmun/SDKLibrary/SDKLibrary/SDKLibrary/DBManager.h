//
//  DBManager.h
//  SDKLibrary
//
//  Created by  on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "DbSchemaDefine.h"

@interface DBManager : NSObject

+ (BOOL)initDataBase;

+ (BOOL)hasItem: (NSString*)schema withConditionval:(id) val;

+ (BOOL)executeUpdate:(NSString*)schema withArgumens: (NSArray*)args;
+ (NSInteger)executeUpdateAndGetLastID:(NSString *)schema withArgumens:(NSArray *)args;

+ (NSMutableArray*)executeQuerry: (NSString*)schema;

+ (NSMutableArray*)executeQuerry: (NSString*)schema withConditionval: (NSArray*)args;

@end
