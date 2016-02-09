//
//  SDKLibraryConfig.m
//  SDKLibrary
//
//  Created by MrKien on 11/15/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "SDKLibraryConfig.h"
#import "Config.h"
#import "DBManager.h"
#import "GroupManager.h"
#import "PlistUtils.h"

SDKLibraryConfig* _sharedSDKLibraryConfig;

@implementation SDKLibraryConfig

+(SDKLibraryConfig*)sharedSDKLibraryConfig {
    if (!_sharedSDKLibraryConfig) {
        _sharedSDKLibraryConfig = [[SDKLibraryConfig alloc] init];
    }
    return _sharedSDKLibraryConfig;
}

-(void)initConfigWithDBName:(NSString*)_dbName BaseURL:(NSString*)_baseURL{
    [[Config sharedSConfig] setBaseURL:_baseURL];
    [[Config sharedSConfig] setDbName:_dbName];
    [[Config sharedSConfig] initDirectory];
    [PlistUtils initializePlistFile];
    if (![DBManager initDataBase]) {
        return;
    };
    [GroupManager initGroups];
}

@end