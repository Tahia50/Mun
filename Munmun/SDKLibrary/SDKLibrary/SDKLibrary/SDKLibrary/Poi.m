//
//  Poi.m
//  SDKLibrary
//
//  Created by Bui Duy Doanh on 11/19/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "Poi.h"
#import "Config.h"
#import "Language.h"

@implementation Poi

- (id)initItem:(id)obj {
    self = [super init];
    if (self) {
        self.dict = [NSMutableDictionary dictionaryWithDictionary:(obj ? obj : @{})];
        self.poiId = [obj objectForKey:kId];
        self.code = [obj objectForKey:kCode];
        self.language = [obj objectForKey:kLanguage];
        NSDictionary *curentlanguage = [self.language objectForKey:[Language getCurrentLangCode]];
        if ([[Language getCurrentLangCode] isEqualToString:japanCode]) {
            self.text = [obj objectForKey:kText];
            self.addressText = [obj objectForKey:kAddressText];
        } else {
            self.text = [curentlanguage objectForKey:kText];
            NSArray *array = nil;
            if ([obj objectForKey:kParts] && [[obj objectForKey:kParts] isKindOfClass:[NSNull class]]) {
                array = [obj objectForKey:kParts];
            } else {
                array = [curentlanguage objectForKey:kAddressParts];
            }
            NSString *componentString = @"";
            if ([[Language getCurrentLangCode] isEqualToString:englishLanguageCode]) {
                componentString = @" ";
            }
            [[array valueForKey:@"description"] componentsJoinedByString:componentString];
        }
        self.parts = [obj objectForKey:kParts];
        self.kanaParts = [obj objectForKey:kKanaParts];
        self.point = [obj objectForKey:kPoint];
        self.kana = [obj objectForKey:kKana];
        self.zipcode = [obj objectForKey:kZipcode];
        if ([obj objectForKey:kResultPhoneNumber] && ![[obj objectForKey:kResultPhoneNumber] isKindOfClass:[NSNull class]]) {
            self.phoneNumber = [obj objectForKey:kResultPhoneNumber];
        }
        self.genre = [obj objectForKey:kGenre];
        self.detail = [obj objectForKey:kDetail];
        
        self.end = [[obj objectForKey:kEnd] boolValue];
        self.bounds = [obj objectForKey:kBounds];
        self.level = [obj objectForKey:kLevel];
        if (obj && [obj objectForKey:kFavourite] && ![[NSNull null] isEqual:[obj objectForKey:kFavourite]]) {
            self.isFavourite = [[obj objectForKey:kFavourite] boolValue];
        } else {
            self.isFavourite = NO;
        }
    }
    return self;
}

- (id)initItem:(id)obj withType:(SearchType)searchType {
    self = [super init];
    if (self) {
        self.dict = [NSMutableDictionary dictionaryWithDictionary:(obj ? obj : @{})];
        self.poiId = [obj objectForKey:kId];
        self.code = [obj objectForKey:kCode];
        self.language = [obj objectForKey:kLanguage];
        if ([self.language isKindOfClass:[NSNull class]]) {
            self.language = nil;
        }
        NSDictionary *curentlanguage = [self.language objectForKey:[Language getCurrentLangCode]];
        self.parts = [obj objectForKey:kParts];
        self.kanaParts = [obj objectForKey:kKanaParts];
        self.point = [obj objectForKey:kPoint];
        self.kana = [obj objectForKey:kKana];
        self.zipcode = [obj objectForKey:kZipcode];
        if ([obj objectForKey:kResultPhoneNumber] && ![[obj objectForKey:kResultPhoneNumber] isKindOfClass:[NSNull class]]) {
            self.phoneNumber = [obj objectForKey:kResultPhoneNumber];
        }
        self.genre = [obj objectForKey:kGenre];
        self.detail = [obj objectForKey:kDetail];
        
        self.end = [[obj objectForKey:kEnd] boolValue];
        self.bounds = [obj objectForKey:kBounds];
        self.level = [obj objectForKey:kLevel];
        if (obj && [obj objectForKey:kFavourite] && ![[NSNull null] isEqual:[obj objectForKey:kFavourite]]) {
            self.isFavourite = [[obj objectForKey:kFavourite] boolValue];
        } else {
            self.isFavourite = NO;
        }
        switch (searchType) {
            case SearchTypeAddress: {
                if (!curentlanguage || [[Language getCurrentLangCode] isEqualToString:japanCode]) {
                    self.addressText = kStringEmpty;
                    self.text = [obj objectForKey:kText];
                } else {
                    NSString *componentString = @"";
                    if ([[Language getCurrentLangCode] isEqualToString:englishLanguageCode]) {
                        componentString = @" ";
                    }
                    self.addressText = kStringEmpty;
                    // get Text
                    if (![[obj objectForKey:kText] isKindOfClass:[NSNull class]]) {
                        self.text = [curentlanguage objectForKey:kText];
                    } else {
                        self.text = [obj objectForKey:kText];
                    }
                }
                break;
            }
            case SearchTypeStation:
            case SearchTypeShop:
            case SearchTypePhoneNumber: {
                if (!curentlanguage || [[Language getCurrentLangCode] isEqualToString:japanCode]) {
                    self.addressText = [obj objectForKey:kAddressText];
                    self.text = [obj objectForKey:kText];
                    self.genre = [obj objectForKey:kGenre];
                } else {
                    if (![[obj objectForKey:kText] isKindOfClass:[NSNull class]]) {
                        self.text = [curentlanguage objectForKey:kText];
                    } else {
                        self.text = [obj objectForKey:kText];
                    }
                    NSMutableArray *addressParts = [curentlanguage objectForKey:kAddressParts];
                    NSString *componentString = @"";
                    if ([[Language getCurrentLangCode] isEqualToString:englishLanguageCode]) {
                        componentString = @" ";
                    }
                    self.addressText = [[addressParts valueForKey:@"description"] componentsJoinedByString:componentString];
                    addressParts = nil;
                    componentString = nil;
                }
                break;
            }
        }
        
    }
    return self;
}

- (id)initItemNew:(id)obj withType:(SearchType)searchType {
    self = [super init];
    if (self) {
        self.dict = [NSMutableDictionary dictionaryWithDictionary:(obj ? obj : @{})];
        self.poiId = [obj objectForKey:kId];
        self.code = [obj objectForKey:kCode];
        self.zipcode = [obj objectForKey:kZipcode];
        self.point = [obj objectForKey:kPoint];
        self.bounds = [obj objectForKey:kBounds];
        self.level = [obj objectForKey:kLevel];
        NSString *boolString = [NSString stringWithFormat:@"%@", [obj objectForKey:kEnd]];
        self.end = [boolString boolValue];
        
        if ([obj objectForKey:kResultPhoneNumber] && ![[obj objectForKey:kResultPhoneNumber] isKindOfClass:[NSNull class]]) {
            self.phoneNumber = [obj objectForKey:kResultPhoneNumber];
        }
        self.url = [obj objectForKey:kUrl];
        boolString = [NSString stringWithFormat:@"%@", [obj objectForKey:kChineseSupport]];
        if ([obj isKindOfClass:[NSNull class]] || ![obj objectForKey:kChineseSupport]) {
            
        } else {
            self.chineseSupport = boolString;
        }
        boolString = [NSString stringWithFormat:@"%@", [obj objectForKey:kCard]];
        self.card = [boolString boolValue];
        boolString = [NSString stringWithFormat:@"%@", [obj objectForKey:kGCard]];
        self.gCard = [boolString boolValue];
        self.sImgUrl = [obj objectForKey:kSImgUrl];
        self.sImgCredit = [obj objectForKey:kSImgCredit];
        self.lImg = [obj objectForKey:kLImg];
        if ([[Language getCurrentLangCode] isEqualToString:defaultJapanLanguageCode]) {
            self.language = [obj objectForKey:kJP];
        } else {
            self.language = [[obj objectForKey:kMLanguage] objectForKey:[Language getCurrentLangCode]];
        }
        if ([self.language isKindOfClass:[NSNull class]]) {
            self.language = nil;
        }
        NSDictionary *originDict = [obj objectForKey:kJP];
        self.text = [self.language objectForKey:kText];
        self.addressText = [self.language objectForKey:kAddressText];
        self.genre = [self.language objectForKey:kGenre];
        self.hours = [self.language objectForKey:kHours];
        self.holiday = [self.language objectForKey:kHoliday];
        self.access = [self.language objectForKey:kAccess];
        self.ctchcpy = [self.language objectForKey:kCTCHCPY];
        self.intro = [self.language objectForKey:kIntro];
        self.price = [self.language objectForKey:kPrice];
        self.kana = [self.language objectForKey:kKana];
        if (![originDict isEqualToDictionary:self.language]) {
            self.defText = [originDict objectForKey:kText];
            self.addressDefText = [originDict objectForKey:kAddressText];
        }
        if (obj && [obj objectForKey:kFavourite] && ![[NSNull null] isEqual:[obj objectForKey:kFavourite]]) {
            self.isFavourite = [[obj objectForKey:kFavourite] boolValue];
        } else {
            self.isFavourite = NO;
        }
        if (searchType == SearchTypeAddress) {
            if ([[Language getCurrentLangCode] isEqualToString:defaultJapanLanguageCode]) {
                self.text = [obj objectForKey:kText];
                self.kana = [obj objectForKey:kKana];
                self.parts = [obj objectForKey:kParts];
            } else {
                self.language = [[obj objectForKey:kLanguage] objectForKey:[Language getCurrentLangCode]];
                self.text = [self.language objectForKey:kText];
                self.defText = [obj objectForKey:kText];
                self.kana = [self.language objectForKey:kKana];
                self.parts = [self.language objectForKey:kParts];
            }
        }
    }
    return self;
}

- (id)initWithDictionary:(id)obj {
    self = [super init];
    if (self) {
        self.dict = [NSMutableDictionary dictionaryWithDictionary:(obj ? obj : @{})];
        self.poiId = [obj objectForKey:kId];
        NSDictionary *curentlanguage = [self.language objectForKey:[Language getCurrentLangCode]];
        if ([[Language getCurrentLangCode] isEqualToString:japanCode]) {
            self.text = [obj objectForKey:kText];
            self.addressText = [obj objectForKey:kAddressText];
        } else {
            self.text = [curentlanguage objectForKey:kText];
            NSArray *array = [curentlanguage objectForKey:kAddressParts];
            NSString *componentString = @"";
            if ([[Language getCurrentLangCode] isEqualToString:englishLanguageCode]) {
                componentString = @" ";
            }
            [[array valueForKey:@"description"] componentsJoinedByString:componentString];
        }
        self.code = [obj objectForKey:kCode];
        self.point = [obj objectForKey:kPoint];
        self.kana = [obj objectForKey:kKana];
        self.zipcode = [obj objectForKey:kZipcode];
        self.phoneNumber = [obj objectForKey:kPhoneNumber];
        self.genre = [obj objectForKey:kGenre];
        self.detail = [obj objectForKey:kDetail];
        self.language = [obj objectForKey:kLanguage];
        self.end = [[obj objectForKey:kEnd] boolValue];
        self.bounds = [obj objectForKey:kBounds];
        self.level = [obj objectForKey:kLevel];
        if (obj && [obj objectForKey:kFavourite] && ![[NSNull null] isEqual:[obj objectForKey:kFavourite]]) {
            self.isFavourite = [[obj objectForKey:kFavourite] boolValue];
        } else {
            self.isFavourite = NO;
        }
    }
    return self;
}

- (NSString *)getGerneName {
    NSString *genrName = @"";
    NSDictionary *curentlanguage = [self.language objectForKey:[Language getCurrentLangCode]];
    if (!curentlanguage || [[Language getCurrentLangCode] isEqualToString:japanCode]) {
        genrName = [self.genre objectForKey:kText];
    } else {
        genrName = [curentlanguage objectForKey:kGenre];
    }
    if (!genrName || [genrName isEqual:[NSNull null]]) {
        return @"";
    }
    //get last path
    if ([genrName rangeOfString:@"/"].location != NSNotFound) {
        NSArray *array = [genrName componentsSeparatedByString:@"/"];
        if (array && [array count] > 0) {
            genrName = [array lastObject];
        }
    }
    return genrName;
}

- (NSString *)getTextByLanguage {
    NSString *text = @"";
    if ([[Language getCurrentLangCode] isEqualToString:japanLanguageCode] || !self.language || [self.language isKindOfClass:[NSNull class]]) {
        text = self.text;
    } else {
        NSDictionary *curentLanguage = [self.language objectForKey:[Language getCurrentLangCode]];
        if (!curentLanguage || [curentLanguage isKindOfClass:[NSNull class]]) {
            text = self.text;
        } else {
            text = [curentLanguage objectForKey:kText];
        }
    }
    return text;
}

- (NSString *)getAddress : (id) addressParts{
    NSString *address = @"";
    if (!addressParts || [addressParts isEqual:[NSNull null]]) {
        return @"";
    }
    if ([addressParts isKindOfClass:[NSString class]]) {
        return addressParts;
    }
    //get last path
    address = [addressParts lastObject];
    return address;
}

+ (NSMutableArray *)getListPoiFromResponseAPI:(id)response {
    NSMutableArray *responseArray = [NSMutableArray new];
    NSArray *array = [response objectForKey:kItem];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Poi *item = [[self alloc] initItem:obj];
        [responseArray addObject:item];
    }];
    return responseArray;
}

+ (NSMutableArray *)getListPoiFromResponseAPI:(id)response searchType:(SearchType)searchType {
    NSMutableArray *responseArray = [NSMutableArray new];
    NSArray *array = [response objectForKey:kItem];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Poi *item = [[self alloc] initItemNew:obj withType:searchType];
        [responseArray addObject:item];
    }];
    return responseArray;
}

@end
