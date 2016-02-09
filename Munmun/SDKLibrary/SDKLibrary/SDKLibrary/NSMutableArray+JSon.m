//
//  NSMutableArray+JSon.m
//  SDKLibrary
//
//  Created by  on 11/23/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "NSMutableArray+JSon.h"

@implementation NSMutableArray (JSon)

- (NSString*)toJson
{
    NSString* json = nil;
    NSError* error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return (error ? nil : json);
}

@end
