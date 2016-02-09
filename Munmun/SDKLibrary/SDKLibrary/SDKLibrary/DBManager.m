//
//  DBManager.m
//  SDKLibrary
//
//  Created by  on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "DBManager.h"
#import "Config.h"

@implementation DBManager

+ (BOOL)hasItem: (NSString*)schema withConditionval:(id) val{
    BOOL retVal = NO;
    FMDatabase *db = [FMDatabase databaseWithPath:DB_SDK_NAME];
    if (![db open]) {
        db = nil;
        retVal = NO;
    }
    FMResultSet* rs = [db executeQuery:schema, val];
    if (rs) {
        if ([rs next]) {
            retVal = YES;
        }
        [rs close];
    }
    [db close];
    return retVal;
}

+ (BOOL)initDataBase {
    if ([[NSFileManager defaultManager] fileExistsAtPath:DB_SDK_NAME]) {
        return NO;
    }
    FMDatabase *db = [FMDatabase databaseWithPath:DB_SDK_NAME];
    if (![db open]) {
        db = nil;
        return NO;
    }
    BOOL ok = NO;
    ok = [db executeUpdate: kSchemaCreateTablePoi];
    if (!ok) {
        return ok;
    }
    ok = [db executeUpdate: kSchemaCreateTablePoiFavourite];
    if (!ok) {
        return ok;
    }
    ok = [db executeUpdate: kSchemaCreateTableGroup];
    if (!ok) {
        return ok;
    }
    ok = [db executeUpdate:kSchemaCreateTableRoute];
    if (!ok) {
        return ok;
    }
    ok = [db executeUpdate:kSchemaCreateTableNaviDB];
    if (!ok) {
        return ok;
    }
    [db close];
    return ok;
}

+ (BOOL)executeUpdate:(NSString*)schema withArgumens: (NSArray*)args {
    BOOL retVal = NO;
    FMDatabase *db = [FMDatabase databaseWithPath:DB_SDK_NAME];
    if (![db open]) {
        db = nil;
        return retVal;
    }
    retVal = [db executeUpdate:schema withArgumentsInArray:args];
    [db close];
    return retVal;
}

+ (NSInteger)executeUpdateAndGetLastID:(NSString *)schema withArgumens:(NSArray *)args {
    NSInteger lastIDInserted = 0;
    FMDatabase *db = [FMDatabase databaseWithPath:DB_SDK_NAME];
    if (![db open]) {
        db = nil;
        return 0;
    }
    if ([db executeUpdate:schema withArgumentsInArray:args]) {
        lastIDInserted = [db lastInsertRowId];
    }
    [db close];
    return lastIDInserted;
}

+ (NSMutableArray *)executeQuerry:(NSString *)schema {
    NSMutableArray *retVal = [[NSMutableArray alloc] init];
    FMDatabase *db = [FMDatabase databaseWithPath:DB_SDK_NAME];
    if (![db open]) {
        db = nil;
        return retVal;
    }
    FMResultSet* rs = [db executeQuery:schema];
    if (rs) {
        while ([rs next]) {
            [retVal addObject:[rs resultDictionary]];
        }
        [rs close];
    }
    [db close];
    return retVal;
}

+ (NSMutableArray*)executeQuerry: (NSString*)schema withConditionval: (NSArray*)args{
    NSMutableArray *retVal = [[NSMutableArray alloc] init];
    FMDatabase *db = [FMDatabase databaseWithPath:DB_SDK_NAME];
    if (![db open]) {
        db = nil;
        return retVal;
    }
    FMResultSet* rs = [db executeQuery:schema withArgumentsInArray:args];
    if (rs) {
        while ([rs next]) {
            [retVal addObject:[rs resultDictionary]];
        }
        [rs close];
    }
    [db close];
    return retVal;
}

@end
