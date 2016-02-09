//
//  NaviDB.h
//  SDKLibrary
//
//  Created by  on 12/18/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NaviResult : NSObject

@property (assign, nonatomic) NSInteger navi_id;
@property (assign, nonatomic) NSInteger route_id;
@property (strong, nonatomic) NSDictionary *navi_data;

- (id)initWithObject:(id)obj;

@end
