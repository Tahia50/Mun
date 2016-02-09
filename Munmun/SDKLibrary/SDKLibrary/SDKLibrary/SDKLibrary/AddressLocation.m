//
//  Location.m
//  SDKLibrary
//
//  Created by  on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "AddressLocation.h"
#import "ModelParamsDefine.h"
#import "Language.h"

AddressLocation* _lastAddresLocation;

@implementation AddressLocation

+(AddressLocation*)lastAddresLocation {
    return _lastAddresLocation;
}

+ (void)setLastAddessToEmpty {
    _lastAddresLocation = nil;
}

- (id)initWithDictionary:(NSDictionary *)dict {
    if(self = [super init]){
        self.text = [dict objectForKey:kText];
        self.defText = [dict objectForKey:kText];
        self.addressText = kStringEmpty;
        self.point = [dict objectForKey:kPoint];
        self.code = [dict objectForKey:kCode];
        self.kana = [dict objectForKey:kKana];
        self.level = [dict objectForKey:kLevel];
        self.language = [dict objectForKey:kLanguage];
        NSString *currentLang = [Language getCurrentLangCode];
        if ([currentLang isEqualToString:kDefaultLangKey]) {
            self.text = [dict objectForKey:kText];
        } else {
            NSDictionary *obj = [self.language objectForKey:currentLang];
            self.text = [obj objectForKey:kText];
            obj = nil;
        }
        currentLang = nil;
    }
    _lastAddresLocation = self;
    return self;
}

@end
