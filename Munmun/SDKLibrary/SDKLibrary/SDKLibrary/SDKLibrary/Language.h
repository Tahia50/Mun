//
//  Language.h
//  SDKLibrary
//
//  Created by  on 11/25/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Language : NSObject
@property (nonatomic,strong)NSDictionary *setting;

- (NSDictionary *) getSettingVal;
- (NSString *) getCurrentKeyLang;

+ (Language *) sharedLanguage;
+ (NSString *) getCurrentLangCode;
+ (NSNumber *) getCurrentMapLangCode;
+ (NSArray *) getLanguages;

@end
