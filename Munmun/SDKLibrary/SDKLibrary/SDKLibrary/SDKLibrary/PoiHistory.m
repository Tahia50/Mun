//
//  PoiHistory.m
//  SDKLibrary
//
//  Created by  on 11/27/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "PoiHistory.h"
#import "ModelParamsDefine.h"
#import "Libs.h"
#import "PoiDetail.h"


@implementation PoiHistory

- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = [dict objectForKey:kName];
        self.addr =  [dict objectForKey:kAddr];
        self.telno =  [dict objectForKey:kTelno];
        self.lat =  [dict objectForKey:kLat];
        self.lon =  [dict objectForKey:kLon];
        self.genre =  [dict objectForKey:kGenre];
        self.genre = self.getGerneName;
        self.distance =  [dict objectForKey:kDistance];
        self.code =  [dict objectForKey:kCode];
        self.accessDate = [dict objectForKey:kAccessDate];
    }
    return self;
}

- (id)initWithPoiAround:(Poi *)poi {
    if (self = [super init]) {
        self.name = [poi.language objectForKey:@"text"];
        self.addr = [poi.language objectForKey:@"addressText"];
        self.telno = poi.phoneNumber;
        self.lat = [poi.point objectForKey:@"lat"];
        self.lon = [poi.point objectForKey:@"lon"];
        self.genre = poi.getGerneName;
        self.distance = poi.distance;
        self.accessDate = [NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]];
        if (poi.code) {
            self.code = poi.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
    }
    return self;
}

- (id)initWithPoi:(Poi *)poi {
    if (self = [super init]) {
        self.name = poi.text;
        self.addr = poi.addressText ? poi.addressText : poi.text;
        self.telno = poi.phoneNumber ? poi.phoneNumber : kStringEmpty;
        self.lat = [poi.point objectForKey:kLat];
        self.lon = [poi.point objectForKey:kLon];
        self.genre = poi.getGerneName;
        self.distance = @"0";
        self.accessDate = [NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]];
        if (poi.code) {
            self.code = poi.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
    }
    return self;
}

- (id)initWithPoiDetail:(id)poi {
    if (self = [super init]) {
        PoiDetail *pDetail = (PoiDetail*)poi;
        self.name = pDetail.name;
        self.addr = pDetail.addr ? pDetail.addr : kStringEmpty;
        self.telno = pDetail.telno ? pDetail.telno : kStringEmpty;
        self.lat = pDetail.lat;
        self.lon = pDetail.lon;
        self.genre = pDetail.genre;
        self.distance = @"0";
        self.accessDate = [NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]];
        if (pDetail.code) {
            self.code = pDetail.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
    }
    return self;
}

- (id)initWithAddressLocation:(AddressLocation *)poi {
    if (self = [super init]) {
        self.name = poi.text;
        self.addr = kStringEmpty;
        self.telno = kStringEmpty;
        self.lat = [poi.point objectForKey:kLat];
        self.lon = [poi.point objectForKey:kLon];
        self.genre = kStringEmpty;
        self.distance = @"0";
        self.accessDate = [NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]];
        if (poi.code) {
            self.code = poi.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
    }
    return self;
}

- (id)initWithAddress:(Address *)poi {
    if (self = [super init]) {
        self.name = poi.text;
        self.addr = kStringEmpty;
        self.telno = kStringEmpty;
        self.lat = [poi.point objectForKey:kLat];
        self.lon = [poi.point objectForKey:kLon];
        self.genre = kStringEmpty;
        self.distance = @"0";
        self.accessDate = [NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]];
        if (poi.code) {
            self.code = poi.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
    }
    return self;
}

- (NSString *)getGerneName {
    NSString *genrName = self.genre;
    //get last path
    if ([genrName rangeOfString:@"/"].location != NSNotFound) {
        NSArray *array = [genrName componentsSeparatedByString:@"/"];
        if (array && [array count] > 0) {
            genrName = [array lastObject];
        }
    }
    return genrName;
}

- (NSString *)accessDateString {
    return [Libs dateFromTimeIntervalToString:self.accessDate format:kHistoryDateFormat];
}

@end
