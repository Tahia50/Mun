//
//  IOFileManager.h
//  SDKLibrary
//
//  Created by  on 1/7/16.
//  Copyright © 2016 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOFileManager : NSObject

+ (BOOL) copyFileFromSrcPath:(NSString *)srcPath toDstPath: (NSString*) dstPath;

+ (BOOL)fileExist: (NSString*)filePath;

+ (NSString*) pathFromBundle: (NSString*)fileName;

+ (NSString*) pathFromDocumentDirectory: (NSString*)subPath;

+ (NSString*) documentDirectory;

@end
