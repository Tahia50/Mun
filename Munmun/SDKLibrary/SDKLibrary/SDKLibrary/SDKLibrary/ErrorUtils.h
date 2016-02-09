//
//  ErrorUtils.h
//  SDKLibrary
//
//  Created by  on 12/14/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

#define E0001               @"E0001"
#define E0035               @"E0035"


@interface ErrorUtils : NSObject

+(NSError*)defaultError;
+(NSError*)emtyRestuError;
+(NSError*)errorWithCode:(NSNumber*)code;

@end
