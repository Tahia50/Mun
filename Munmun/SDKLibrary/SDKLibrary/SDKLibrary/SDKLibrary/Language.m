//
//  Language.m
//  SDKLibrary
//
//  Created by  on 11/25/15.
//  Copyright © 2015 SDK. All rights reserved.
//
#import "Language.h"
#import "ModelParamsDefine.h"

#import "Libs.h"
#define kSettingLanguage            @"Languages.plist"
#define kLangcode                   @"langcode"
#define kMaplangcode                @"maplangcode"
#define DEFAULTS_KEY_LANGUAGE       @"LanguageCode"
#define kZH_Hans_CN  @"zh-Hans-CN"
#define kZH_Hant_TW  @"zh-Hant-TW"
#define kZH_Hans  @"zh-Hans"
#define kZH_Hant  @"zh-Hant"

@implementation Language

#pragma mark - Object Lifecycle
+ (Language *)sharedLanguage {
    // Create a singleton.
    static dispatch_once_t once;
    static Language *language;
    dispatch_once(&once, ^ { language = [[Language alloc] init]; });
    return language;
}

- (id)init {
    self = [super init];
    if (self) {
        self.setting = [self getSettingVal];
    }
    return self;
}

- (NSDictionary*) getSettingVal {
    return [Libs dictionaryWithContentsOfJSONString:kSettingLanguage];
}

- (NSString *) getCurrentKeyLang {
    return [[NSUserDefaults standardUserDefaults] stringForKey:DEFAULTS_KEY_LANGUAGE];
}

+ (NSString *) getCurrentLangCode {
    NSString *key = [[NSUserDefaults standardUserDefaults] stringForKey:DEFAULTS_KEY_LANGUAGE];
    key = (key) ? key : kDefaultKey ;
    return [[[Language sharedLanguage].setting objectForKey:key] objectForKey:kLangcode];
}

+ (NSNumber *) getCurrentMapLangCode {
    NSString *key = [[NSUserDefaults standardUserDefaults] stringForKey:DEFAULTS_KEY_LANGUAGE];
    key = (key) ? key : kDefaultKey ;
    return [[[Language sharedLanguage].setting objectForKey:key] objectForKey:kMaplangcode];
}

+ (NSArray *) getLanguages {
    NSNumber *defaultNumber = [[[Language sharedLanguage].setting objectForKey:kDefaultKey] objectForKey:kMaplangcode];
    NSMutableArray *languages = [[NSMutableArray alloc] init];
    NSString *key = [[NSUserDefaults standardUserDefaults] stringForKey:DEFAULTS_KEY_LANGUAGE];
    if (![key isEqualToString:kDefaultKey]) {
        NSNumber *currentNumber = [[[Language sharedLanguage].setting objectForKey:key] objectForKey:kMaplangcode];
        if (!currentNumber) {
            [languages addObject:defaultNumber];
            return languages;
        }
        [languages addObject: currentNumber];
    }
    [languages addObject:defaultNumber];
    return languages;
}

@end
