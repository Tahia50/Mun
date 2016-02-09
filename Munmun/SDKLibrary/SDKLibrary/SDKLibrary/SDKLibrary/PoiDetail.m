//
//  PoiDetail.m
//  SDKLibrary
//
//  Created by  on 11/30/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "PoiDetail.h"
#import "Libs.h"

@implementation PoiDetail
- (id)initWithPoiAround:(Poi *)poi {
    if (self = [super init]) {
        self.name = [poi.language objectForKey:@"text"];
        self.addr = [poi.language objectForKey:@"addressText"];
        self.telno = poi.phoneNumber;
        self.lat = [poi.point objectForKey:@"lat"];
        self.lon = [poi.point objectForKey:@"lon"];
        self.genre = poi.getGerneName;
        self.distance = poi.distance;
        self.ckbn =  POI_CKBN_DIDX_DKE;
        self.accessDate = [NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]];
        if (poi.code) {
            self.code = poi.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
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
        self.ckbn = POI_CKBN_DIDX_ZPOI;;
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

- (id)initWithPoiFavourite:(PoiFavourite *)poi {
    if (self = [super init]) {
        self.pId = poi.pId;
        self.name = poi.name;
        self.addr = poi.addr;
        self.telno = poi.telno;
        self.lat = poi.lat;
        self.lon = poi.lon;
        self.genre = poi.getGerneName;
        self.distance = poi.distance;
        self.accessDate = poi.accessDate;
        if (poi.code) {
            self.code = poi.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
        self.nearalarm_flg = poi.nearalarm_flg ? poi.nearalarm_flg : [NSNumber numberWithBool:NO];
        self.onmap_flg = poi.onmap_flg ? poi.onmap_flg : [NSNumber numberWithBool:NO];
        self.ckbn =  poi.ckbn? poi.ckbn :POI_CKBN_REG;
        self.comment = poi.comment ?  poi.comment :kStringEmpty;
        self.groupId = poi.groupId ?  poi.groupId : [NSNumber numberWithInteger:0];
        self.groupName = poi.groupName ?  poi.groupName :kGroupNameUnknow;
    }
    return self;
}

- (id)initWithPoi:(Poi *)poi {
    if (self = [super init]) {
        self.name = poi.text;
        self.nameDef = poi.defText;
        self.addr = poi.addressText ? poi.addressText : kStringEmpty;
        self.addrDef = poi.addressDefText ? poi.addressDefText : kStringEmpty;
        self.telno = poi.phoneNumber ? poi.phoneNumber : kStringEmpty;
        self.lat = [poi.point objectForKey:kLat];
        self.lon = [poi.point objectForKey:kLon];
        self.genre = poi.getGerneName;
        self.ckbn =  POI_CKBN_DIDX_DKE;
        self.distance = @"0";
        self.url = poi.url;
        self.sImgUrl = poi.sImgUrl;
        self.sImgCredit = poi.sImgCredit;
        self.lImg = poi.lImg;
        self.chineseSupport = poi.chineseSupport;
        self.gCard = poi.gCard;
        self.card = poi.card;
        self.hours = poi.hours;
        self.holiday = poi.holiday;
        self.access = poi.access;
        self.ctchcpy = poi.ctchcpy;
        self.intro = poi.intro;
        self.price = poi.price;
        if (poi.code) {
            self.code = poi.code;
        } else {
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
    }
    return self;
}

- (id)initWithAddressLocation:(AddressLocation *)poi {
    if (self = [super init]) {
        self.name = [poi getTextByLanguage];
        self.addr = kStringEmpty;
        self.telno = kStringEmpty;
        self.lat = [poi.point objectForKey:kLat];
        self.lon = [poi.point objectForKey:kLon];
        self.genre = kStringEmpty;
        self.ckbn =  POI_CKBN_ADDR;
        self.distance = @"0";
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
        self.defText = poi.defText;
        self.addr = kStringEmpty;
        self.telno = kStringEmpty;
        self.lat = [poi.point objectForKey:kLat];
        self.lon = [poi.point objectForKey:kLon];
        self.genre = kStringEmpty;
        self.ckbn =  POI_CKBN_ADDR;
        self.distance = @"0";
        if (poi.code) {
            self.code = poi.code;
        }else{
            self.code = [NSString stringWithFormat:@"%@_%@_%@",self.lat,self.lon,self.name];
        }
    }
    return self;
}

- (NSString *)accessDateString {
    return [Libs dateFromTimeIntervalToString:self.accessDate format:kHistoryDateFormat];
}

@end
