//
//  PlistUtils.h
//  SDKLibrary
//
//  Created by  on 1/7/16.
//  Copyright © 2016 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistUtils : NSObject

+ (void)initializePlistFile;

+ (BOOL)changePlist:(NSString *)name withKey:(NSString *)key withValue:(id)value;

+ (id)getValueFromPlist:(NSString *)name withKey:(NSString *)key;

@end
