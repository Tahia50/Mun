//
//  Libs.m
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "Libs.h"
#import "ModelParamsDefine.h"
#import "Reachability.h"

@implementation Libs

+ (BOOL)hasNetworkConnection {
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus] == NotReachable) {
        return NO;
    }
    return YES;
}

+(NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation{
    NSString *bundlePaths = [[NSBundle mainBundle] pathForResource:kSDKBundle

                                                            ofType:@"bundle"];
    NSBundle* bundle=[NSBundle bundleWithPath: bundlePaths];
    NSString *filePath = [bundle pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    if ([[fileLocation pathExtension] isEqual:PLIST]) {
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
        return dict;
    }
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    // Be careful here. You add this as a category to NSDictionary
    // but you get an id back, which means that result
    // might be an NSArray as well!
    if (error != nil) return nil;
    return result;
}

//---Add by Thanh Ta 2015-11-18 begin---
+ (NSString *)htmlEntityDecode:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    string = [string stringByReplacingOccurrencesOfString:@"&copy;" withString:@"©"];
    string = [string stringByReplacingOccurrencesOfString:@"&reg;" withString:@"®"];
    string = [string stringByReplacingOccurrencesOfString:@"null" withString:@"\"\""];
    return string;
}
//---Add by Thanh Ta 2015-11-18 end---

+(NSString*)stringFromDictOrEmpty:(NSDictionary*)dict :(id)key {
    if (dict &&
        [dict objectForKey:key] &&
        ![[NSNull null] isEqual:[dict objectForKey:key]]) {
        //Modify by Thanh Ta begin
        //if key is equal text then return text
        //else key is equal array then return last object of part array
        id object = [dict objectForKey:key];
        if ([object isKindOfClass:[NSString class]]) {
            return [dict objectForKey:key];
        }
        if ([object isKindOfClass:[NSNumber class]]) {
            return [[dict objectForKey:key] stringValue];
        }
        else if ([object isKindOfClass:[NSArray class]]){
            return [(NSArray*)object lastObject];
        }
    }
    return kStringEmpty;
}

+ (NSString*)dateToString:(NSDate*)date format:(NSString*)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

//ngocdu task885
+ (NSDate *)stringToDate : (NSString *) string format: (NSString*)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}
//end

+ (NSString*)dateFromTimeIntervalToString : (NSString *) timeInterval format: (NSString*)format {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *intervalTime = [f numberFromString:timeInterval];
    NSTimeInterval intervalForTimer = [intervalTime doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:intervalForTimer];
    NSDateFormatter *formatter;
    NSString        *dateString;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    dateString = [formatter stringFromDate:date];
    formatter = nil;
    return dateString;
}

+ (NSNumber*)numberWithString: (NSString*)string {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    return [f numberFromString:string];
}

+ (void)createFolderIfNotExist: (NSString*)folderpath {
    if ([Libs stringIsNilOrEmpty:folderpath]) {
        return;
    }
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:folderpath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        return;
    }
    [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error];
}

+(BOOL)stringIsNilOrEmpty:(NSString*)aString {
    return !(aString && aString.length);
}

+ (NSDictionary *)convertStringToDictionary:(NSString *)jsonString {
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return json;
}

+ (NSString *)convertDictionaryToString:(NSDictionary *)dict {
    NSError* error;
    //giving error as it takes dic, array,etc only. not custom object.
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString* nsJson=  [[NSString alloc] initWithData:jsonData
                                             encoding:NSUTF8StringEncoding];
    return nsJson;
}

+ (NSArray*) sortedKeysFromDict: (NSDictionary*)dict {
    NSArray *keys = [dict allKeys];
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [(NSString *)obj1 compare:(NSString *)obj2 options:NSNumericSearch];
    }];
    return keys;
}

@end
