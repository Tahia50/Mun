//
//  RouteResult.h
//  SDKLibrary
//
//  Created by  on 12/11/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RouteResult : NSObject

@property (assign, nonatomic) NSInteger route_id;
@property (strong, nonatomic) NSString *navi_id;
@property (strong, nonatomic) NSString *route_type;
@property (strong, nonatomic) NSDictionary *time;
@property (strong, nonatomic) NSString *use;
@property (strong, nonatomic) NSString *use_id;
@property (strong, nonatomic) NSString *trainkey;
@property (strong, nonatomic) NSString *transcnt;
@property (strong, nonatomic) NSString *route_flg;
@property (strong, nonatomic) NSString *route_flg_type;
@property (strong, nonatomic) NSString *car_type;
@property (strong, nonatomic) NSString *fare;
@property (strong, nonatomic) NSString *ic_exist;
@property (strong, nonatomic) NSString *ic_fare;
@property (strong, nonatomic) NSString *total_time;
@property (strong, nonatomic) NSString *distance;
@property (strong, nonatomic) NSDictionary *start;
@property (strong, nonatomic) NSDictionary *goal;
@property (strong, nonatomic) NSString *traffic;
@property (strong, nonatomic) NSArray *icons;
@property (strong, nonatomic) NSDictionary *nodes;
@property (strong, nonatomic) NSString *route_name;
@property (strong, nonatomic) NSString *timestamp;
@property (strong, nonatomic) NSString *frameKbn;

- (id)initWithItem:(NSDictionary *)obj;

@end
