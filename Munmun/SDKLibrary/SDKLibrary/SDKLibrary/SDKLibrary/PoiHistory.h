//
//  PoiHistory.h
//  SDKLibrary
//
//  Created by  on 11/27/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poi.h"
#import "AddressLocation.h"
#import "Address.h"

@interface PoiHistory : NSObject
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

- (id)initWithDictionary:(NSDictionary *)dict;
- (id)initWithPoiAround:(Poi *)poi;
- (id)initWithAddressLocation:(AddressLocation *)poi;
- (id)initWithAddress:(Address *)poi;
- (id)initWithPoi:(Poi *)poi;
- (id)initWithPoiDetail:(id)poi;
- (NSString *)getGerneName;
- (NSString *)accessDateString;

@end
