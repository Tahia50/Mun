//
//  Config.m
//  SDKLibrary
//
//  Created by  on 11/19/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "Config.h"
#import "ModelParamsDefine.h"
#import "Libs.h"

Config* _sharedConfig;

@implementation Config

+(Config*)sharedSConfig {
    if (!_sharedConfig) {
        _sharedConfig = [[Config alloc] init];
    }
    return _sharedConfig;
}

- (void)initDirectory {
    [Libs createFolderIfNotExist:ROOT_PATH];
    [Libs createFolderIfNotExist:MAP_PATH];
    [Libs createFolderIfNotExist:USER_PATH];
    [Libs createFolderIfNotExist:DB_PATH];
    [Libs createFolderIfNotExist:PLIST_PATH];
    [Libs createFolderIfNotExist:LOG_PATH];
}

+ (NSString*)getBaseURL{
    return [[Config sharedSConfig] baseURL];
}

+ (NSString*)getDBName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@",DB_PATH,[[Config sharedSConfig] dbName]]];
}


+ (NSString *)getRootPath {
    return [NSString stringWithFormat:@"%@",kRootDirectory];
}

+ (NSString *)getUserPath {
    return [NSString stringWithFormat:@"%@/%@",kRootDirectory,kUserDirectory];
}

+ (NSString *)getMapPath {
    return [NSString stringWithFormat:@"%@/%@",kRootDirectory,kMapDirectory];
}

+ (NSString *)getDBPath {
    return [NSString stringWithFormat:@"%@/%@",USER_PATH,kDbDirectory];
}

+ (NSString*)getPlistPath {
    return [NSString stringWithFormat:@"%@/%@",USER_PATH,kPlistDirectory];
}

+ (NSString *)getLogPath {
    return [NSString stringWithFormat:@"%@/%@",USER_PATH,kLogDirectory];
}

@end