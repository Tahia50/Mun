//
//  PoiAddress.h
//  SDKLibrary
//
//  Created by  on 11/19/15.
//  Copyright © 2015 SDK. All rights reserved.
//
#import "Config.h"

typedef enum {
    END_FLAG_NULL,
    END_FLAG_FALSE,
    END_FLAG_TRUE
}END_FLAG;

#define kTod @"tod"//都道府県
#define kShk @"shk"//市区町村
#define kOaz @"oaz"//大字
#define kAzc @"azc"//字丁目
#define kGik @"gik"//街区
#define kTbn @"tbn"//地番
#define kEbn @"ebn"//枝番

@interface Address : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *defText;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSDictionary *point;
@property (nonatomic, strong) NSDictionary *language;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *lastPart;
@property (nonatomic, strong) NSString *defLastPart;
@property (nonatomic, assign) END_FLAG end;
@property (nonatomic, assign) NSInteger hit;

@property (nonatomic, strong) NSString *parentText;
@property (nonatomic, strong) NSString *parentCode;
@property (nonatomic, assign) NSInteger count;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
