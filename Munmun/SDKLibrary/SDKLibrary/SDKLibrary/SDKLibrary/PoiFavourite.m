//
//  PoiFavourite.m
//  SDKLibrary
//
//  Created by  on 11/30/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "PoiFavourite.h"
#import "PoiDetail.h"
#define kCKBNDefault        POI_CKBN_REG

@implementation PoiFavourite
- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.pId = [dict objectForKey:kId];
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
        self.isFavourite = ([dict objectForKey:kFavourite]);
        self.isFavourite = (self.isFavourite) ? self.isFavourite : [NSNumber numberWithBool:NO];
        self.nearalarm_flg = ([dict objectForKey:kNearalarm]);
        self.nearalarm_flg = (self.nearalarm_flg) ? self.nearalarm_flg : [NSNumber numberWithBool:NO];
        self.onmap_flg = ([dict objectForKey:kOnmap]);
        self.onmap_flg = (self.onmap_flg) ? self.onmap_flg :[NSNumber numberWithBool:NO];
        self.ckbn = ([dict objectForKey:kCkbn]);
        self.ckbn = (self.ckbn) ? self.ckbn :kCKBNDefault;
        self.comment = [dict objectForKey:kComment];
        self.comment = (self.comment) ? self.comment : kStringEmpty;
        self.groupId = [dict objectForKey:kGId];
        self.groupId = (self.groupId) ? self.groupId : [NSNumber numberWithInteger:0];
        self.groupName = [dict objectForKey:kGName];
        self.groupName = (self.groupName) ? self.groupName : kGroupNameUnknow;
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
        self.isFavourite = [NSNumber numberWithBool:NO];
        self.nearalarm_flg = [NSNumber numberWithBool:NO];
        self.onmap_flg = [NSNumber numberWithBool:NO];
        self.ckbn = kCKBNDefault;
        self.comment = kStringEmpty;
        self.groupId = [NSNumber numberWithInteger:0];
        self.groupName = kGroupNameUnknow;
    }
    return self;
}

- (id)initWithPoiHistory:(PoiHistory *)poi {
    if (self = [super init]) {
        self.name = poi.name;
        self.addr = poi.addr;
        self.telno = poi.telno;
        self.lat = poi.lat;
        self.lon = poi.lon;
        self.genre = poi.getGerneName;
        self.distance = poi.distance;
        self.accessDate = [NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]];
        if (poi.code) {
            self.code = poi.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
        self.isFavourite = [NSNumber numberWithBool:NO];
        self.nearalarm_flg = [NSNumber numberWithBool:NO];
        self.onmap_flg = [NSNumber numberWithBool:NO];
        self.ckbn = kCKBNDefault;
        self.comment = kStringEmpty;
        self.groupId = [NSNumber numberWithInteger:0];
        self.groupName = kGroupNameUnknow;
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
        self.isFavourite = [NSNumber numberWithBool:NO];
        self.nearalarm_flg = [NSNumber numberWithBool:NO];
        self.onmap_flg = [NSNumber numberWithBool:NO];
        self.ckbn = kCKBNDefault;
        self.comment = kStringEmpty;
        self.groupId = [NSNumber numberWithInteger:0];
        self.groupName = kGroupNameUnknow;
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
        self.nearalarm_flg = [NSNumber numberWithBool:NO];
        self.onmap_flg = [NSNumber numberWithBool:NO];
        self.ckbn = kCKBNDefault;
        self.comment = kStringEmpty;
        self.groupId = [NSNumber numberWithInteger:0];
        self.groupName = kGroupNameUnknow;
    }
    return self;
}
- (id)initWithPoiDetail:(id )poi {
    if (self = [super init]) {
        PoiDetail *pDetail = (PoiDetail*)poi;
        self.pId = pDetail.pId;
        self.name = pDetail.name;
        self.addr = pDetail.addr;
        self.telno = pDetail.telno;
        self.lat = pDetail.lat;
        self.lon = pDetail.lon;
        self.genre = pDetail.genre;
        self.distance = @"0";
        self.accessDate = [NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]];
        self.code = pDetail.code;
        self.isFavourite = [NSNumber numberWithBool:NO];
        self.nearalarm_flg = pDetail.nearalarm_flg ? pDetail.nearalarm_flg : [NSNumber numberWithBool:NO];
        self.onmap_flg = pDetail.onmap_flg ? pDetail.onmap_flg : [NSNumber numberWithBool:NO];
        self.ckbn =  pDetail.ckbn ?  pDetail.ckbn :kCKBNDefault;
        self.comment = pDetail.comment ?  pDetail.comment :kStringEmpty;
        self.groupId =  (pDetail.groupId || [pDetail.groupId isEqual:[NSNull null]])?  pDetail.groupId : [NSNumber numberWithInteger:0];
        self.groupName = pDetail.groupName ?  pDetail.groupName :kGroupNameUnknow;
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
