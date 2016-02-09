//
//  SDKLibraryConfig.h
//  SDKLibrary
//
//  Created by MrKien on 11/15/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDKLibraryConfig : NSObject

+(SDKLibraryConfig*)sharedSDKLibraryConfig;

-(void)initConfigWithDBName: (NSString*)_dbName BaseURL: (NSString*)_baseURL;

@end
