//
//  PlistUtils.m
//  SDKLibrary
//
//  Created by  on 1/7/16.
//  Copyright © 2016 SDK. All rights reserved.
//

#import "PlistUtils.h"
#import "IOFileManager.h"
#import "ModelParamsDefine.h"
#import "Config.h"

@implementation PlistUtils

+ (void)initializePlistFile {
    [PlistUtils copySDKSettingData];
}

+ (BOOL)changePlist:(NSString *)name withKey:(NSString *)key withValue:(id)value {
    BOOL success = NO;

    @synchronized(self){

        NSString *dstPath = [IOFileManager pathFromDocumentDirectory:[NSString stringWithFormat:@"%@/%@",PLIST_PATH,name]];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:dstPath];
        [dic setValue:value forKey:key];
        success = [dic writeToFile:dstPath atomically:YES];
    }

    return success;
}

+ (id)getValueFromPlist:(NSString *)name withKey:(NSString *)key {
    id value = nil;

    @synchronized(self){
        NSString *dstPath = [IOFileManager pathFromDocumentDirectory:[NSString stringWithFormat:@"%@/%@",PLIST_PATH,name]];
        if (![IOFileManager fileExist:dstPath]) {
            NSString *srcPath =  [IOFileManager pathFromBundle:name];
            [IOFileManager copyFileFromSrcPath:srcPath toDstPath:dstPath];
            srcPath = nil;
        }
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:dstPath];
        value = [dic objectForKey:key];
        dic = nil;
    }

    return value;
}

+ (void) copySDKSettingData {
    NSString *srcPath = [IOFileManager pathFromBundle:kSDKSettingData];
    NSString *dstPath = [IOFileManager pathFromDocumentDirectory:[NSString stringWithFormat:@"%@/%@",PLIST_PATH,kSDKSettingData]];
    [IOFileManager copyFileFromSrcPath:srcPath toDstPath:dstPath];
}

@end
