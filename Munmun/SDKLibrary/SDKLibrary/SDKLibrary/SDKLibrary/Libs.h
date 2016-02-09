//
//  Libs.h
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kHistoryDateFormat          @"YYYY/MM/dd"
#define kFullDateFormat          @"dd/MM/yyyy hh:mm:ss"

@interface Libs : NSObject
+ (BOOL)hasNetworkConnection;
+ (NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation;
//---Add by Thanh Ta 2015-11-18 begin---
+ (NSString *)htmlEntityDecode:(NSString *)string;
//---Add by Thanh Ta 2015-11-18 end---
+ (NSString*)stringFromDictOrEmpty:(NSDictionary*)dict :(id)key;
+ (NSString*)dateToString : (NSDate *) date format: (NSString*)format ;
//ngocdu task885
+ (NSDate *)stringToDate : (NSString *) string format: (NSString*)format ;
//end
+ (NSString*)dateFromTimeIntervalToString : (NSString *) timeInterval format: (NSString*)format;
+ (NSNumber*)numberWithString: (NSString*)string;
+ (void)createFolderIfNotExist: (NSString*)folderpath;
+ (BOOL)stringIsNilOrEmpty:(NSString*)aString;
+ (NSDictionary *)convertStringToDictionary:(NSString *)jsonString;
+ (NSString *)convertDictionaryToString:(NSDictionary *)dict;
+ (NSArray*) sortedKeysFromDict: (NSDictionary*)dict;

@end
