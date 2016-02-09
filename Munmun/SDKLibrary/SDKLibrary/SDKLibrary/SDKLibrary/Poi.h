//
//  Poi.h
//  SDKLibrary
//
//  Created by Bui Duy Doanh on 11/19/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Libs.h"
#import "ModelParamsDefine.h"

/*!
 * @Object Poi
 * @brief A list of poi field.
 * @property (strong, nonatomic)NSString poiId
 */
@interface Poi : NSObject

@property (strong, nonatomic) NSMutableDictionary *dict;
@property (strong, nonatomic) NSString *poiId;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *defText;
@property (strong, nonatomic) NSString *code;
@property (strong, nonatomic) NSDictionary *point;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *chineseSupport;
@property (assign, nonatomic) BOOL card;
@property (assign, nonatomic) BOOL gCard;
@property (strong, nonatomic) NSString *sImgUrl;
@property (strong, nonatomic) NSString *sImgCredit;
@property (strong, nonatomic) NSArray  *lImg;
@property (strong, nonatomic) NSString *hours;
@property (strong, nonatomic) NSString *holiday;
@property (strong, nonatomic) NSString *access;
@property (strong, nonatomic) NSString *ctchcpy;
@property (strong, nonatomic) NSString *intro;
@property (strong, nonatomic) NSString *price;

@property (strong, nonatomic) NSString *kana;
@property (strong, nonatomic) NSString *addressText;
@property (strong, nonatomic) NSString *addressDefText;
@property (strong, nonatomic) NSString *zipcode;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *ckbn;
@property (strong, nonatomic) NSDictionary *genre;

@property (strong, nonatomic) NSMutableDictionary *bounds;
@property (strong, nonatomic) id detail;
@property (strong, nonatomic) NSMutableDictionary *language;
@property (assign, nonatomic) BOOL end;
@property (strong, nonatomic) NSString *level;
@property (strong, nonatomic) NSMutableArray *parts;
@property (strong, nonatomic) NSMutableArray *kanaParts;
@property (assign, nonatomic) BOOL isFavourite;
@property (assign, nonatomic) SearchType searchType;
@property (strong, nonatomic) NSMutableDictionary *arrivalInfo;
//ngocdu task871
@property (strong, nonatomic) NSString *distance;
@property (assign, nonatomic) NSInteger hit;
//end
- (id)initItem:(id)obj;
- (id)initWithDictionary:(id)obj;
- (id)initItem:(id)obj withType:(SearchType)searchType;
- (id)initItemNew:(id)obj withType:(SearchType)searchType;

- (NSString *)getGerneName;
- (NSString *)getTextByLanguage;

+ (NSMutableArray *)getListPoiFromResponseAPI:(id)response;
+ (NSMutableArray *)getListPoiFromResponseAPI:(id)response searchType:(SearchType)searchType;

@end
