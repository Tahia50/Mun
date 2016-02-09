//
//  PoiDetail.h
//  SDKLibrary
//
//  Created by  on 11/30/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poi.h"
#import "PoiHistory.h"
#import "PoiFavourite.h"
#import "Address.h"

@interface PoiDetail : NSObject
@property (nonatomic, strong) NSNumber *pId;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *addr;
@property (nonatomic, strong) NSString *addrDef;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nameDef;
@property (nonatomic, strong) NSString *telno;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSNumber *nearalarm_flg;
@property (nonatomic, strong) NSNumber *onmap_flg;
@property (nonatomic, strong) NSString *ckbn;
@property (nonatomic, strong) NSNumber *groupId;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *accessDate;
@property (nonatomic, strong) Class alass;
@property (nonatomic, strong) NSString *defText;


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

- (id)initWithPoiAround:(Poi *)poi;
- (id)initWithPoiHistory:(PoiHistory *)poi;
- (id)initWithPoiFavourite:(id)poi;
- (id)initWithAddressLocation:(AddressLocation *)poi;
- (id)initWithPoi:(Poi *)poi;
- (id)initWithAddress:(Address *)poi;
- (NSString *)accessDateString;

@end
