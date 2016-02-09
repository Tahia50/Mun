//
//  IOFileManager.m
//  SDKLibrary
//
//  Created by  on 1/7/16.
//  Copyright © 2016 SDK. All rights reserved.
//

#import "IOFileManager.h"
#import "ModelParamsDefine.h"
#import "Config.h"


@implementation IOFileManager

+ (BOOL) copyFileFromSrcPath:(NSString *)srcPath toDstPath: (NSString*) dstPath {
    if ([IOFileManager fileExist:dstPath])
    {
        return YES;
    }
    return [[NSFileManager defaultManager] copyItemAtPath:srcPath toPath:dstPath error:nil];
}

+ (BOOL) fileExist: (NSString*)filePath {
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

+ (NSString*) pathFromBundle: (NSString*)fileLocation {
    NSString *bundlePaths = [[NSBundle mainBundle] pathForResource:kSDKBundle
                                                            ofType:BUNDLE];
    NSBundle* bundle=[NSBundle bundleWithPath: bundlePaths];
    return [bundle pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
}

+ (NSString*) pathFromDocumentDirectory: (NSString*)subPath {
    return [[IOFileManager documentDirectory] stringByAppendingPathComponent:subPath];
}

+ (NSString*) documentDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

@end
