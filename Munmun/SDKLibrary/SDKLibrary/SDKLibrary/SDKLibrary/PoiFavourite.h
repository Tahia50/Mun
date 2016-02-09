//
//  PoiFavourite.h
//  SDKLibrary
//
//  Created by  on 11/30/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "Poi.h"
#import "PoiHistory.h"
#import "PoiDetail.h"
#import "AddressLocation.h"

@interface PoiFavourite : NSObject
@property (nonatomic, strong) NSNumber *pId;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) NSString *addr;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *telno;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *accessDate;
@property (nonatomic, strong) NSNumber *isFavourite;
@property (nonatomic, strong) NSNumber *nearalarm_flg;
@property (nonatomic, strong) NSNumber *onmap_flg;
@property (nonatomic, strong) NSString *ckbn;
@property (nonatomic, strong) NSNumber *groupId;
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NSString *comment;

- (id)initWithDictionary:(NSDictionary *)dict;
- (id)initWithPoiAround:(Poi *)poi;
- (id)initWithPoiHistory:(PoiHistory *)poi;
- (id)initWithAddressLocation:(AddressLocation *)poi;
- (id)initWithPoi:(Poi *)poi;
- (id)initWithPoiDetail:(id)poi;
- (NSString *)getGerneName;
- (NSString *)accessDateString;
@end
