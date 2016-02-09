//
//  PoiGenre.m
//  SDKLibrary
//
//  Created by  on 11/24/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "PoiGenre.h"

@implementation PoiGenre
- (id)initWithDictionary:(NSDictionary *)dict {
    if(self = [super initWithDictionary:dict]){
//        self.lat = [[dict objectForKey:@"lat"] isKindOfClass:[NSNumber class]]? [NSString stringWithFormat:@"%li",[[dict objectForKey:@"lat"] integerValue]] : [dict objectForKey:@"lat"];
//        self.lon = [[dict objectForKey:@"lng"] isKindOfClass:[NSNumber class]]? [NSString stringWithFormat:@"%li",[[dict objectForKey:@"lng"] integerValue]] : [dict objectForKey:@"lng"];
//        
//        NSDictionary *params = [dict objectForKey:@"parameters"];
//        if (params && [params isKindOfClass:[NSDictionary class]]) {
//            self.addr = [params objectForKey:@"addr"];
//            self.gnrnm = [params objectForKey:@"gnrnm"];
//            self.gnrnm = [self getGerneName];
//            self.name = [params objectForKey:@"name"];
//            self.telno = [params objectForKey:@"telno"];
//            self.distance = [NSString stringWithFormat:@"%li",[[params objectForKey:@"distance"] longValue]];
//        }
    }
    return self;
}
@end
