//
//  PoiAddress.m
//  SDKLibrary
//
//  Created by  on 11/19/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "Address.h"
#import "ModelParamsDefine.h"
#import "Language.h"
#import "Libs.h"

@implementation Address
- (id)initWithDictionary:(NSDictionary *)dict {
    if(self = [super init]){
        self.text = [dict objectForKey:kText];
        self.defText = [dict objectForKey:kText];
        self.language  = [dict objectForKey:kLanguage];
        NSString *currentLang = [Language getCurrentLangCode];
        self.point = [dict objectForKey:kPoint];
        self.code = [dict objectForKey:kCode];
        self.level = [dict objectForKey:kLevel];
        
        NSArray *defParts = [dict objectForKey:kParts];
        self.defText = [dict objectForKey:kText];
        if (!defParts) {
            self.defLastPart = kStringEmpty;
        } else if ([defParts isKindOfClass: [NSString class]]) {
            self.defLastPart = (NSString*)defParts;
        } else if ([defParts isKindOfClass:[NSArray class]]) {
            self.defLastPart = [defParts lastObject];
        }
        defParts = nil;
        
        NSArray *parts = nil;
        NSString *text = kStringEmpty;
        if ([currentLang isEqualToString:kDefaultLangKey]) {
            text = [dict objectForKey:kText];
            parts = [dict objectForKey:kParts] ;
        } else {
            NSDictionary *obj = [self.language objectForKey:currentLang];
            text = [obj objectForKey:kText];
            parts = [obj objectForKey:kParts];
        }
        if (!parts) {
            self.lastPart = kStringEmpty;
            self.text = text;
        } else if ([parts isKindOfClass: [NSString class]]) {
            self.text = text;
            self.lastPart = (NSString*)parts;
        } else if ([parts isKindOfClass:[NSArray class]]) {
            self.lastPart = [parts lastObject];
            if (parts.count <= 1) {
                self.text = text;
            } else {
                NSMutableArray *arr = [NSMutableArray arrayWithArray:parts];
                NSString *firstPart = [arr objectAtIndex:0];
                // temporary comment, will confirm later
//                self.text = [text stringByReplacingOccurrencesOfString:firstPart withString:kStringEmpty];
                self.text = text;
                firstPart = nil;
                [arr removeAllObjects];
                arr = nil;
            }
        }
        parts = nil;
        text = nil;
        if ([dict objectForKey:kEnd]) {
            self.end =([[dict objectForKey:kEnd] boolValue])?END_FLAG_TRUE:END_FLAG_FALSE;
        } else {
            self.end = END_FLAG_NULL;
        }
    }
    return self;
}

@end
