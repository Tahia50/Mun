//
//  NaviDBManager.h
//  SDKLibrary
//
//  Created by  on 12/18/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NaviDBManager : NSObject
/*!
 * @brief description
 * @param data NSDictionary
 * @code  route_id NSInteger
 *
 */
+ (BOOL)saveNaviData:(NSDictionary *)data route_id:(NSInteger)route_id;
/*!
 * @brief request navigation data of route.
 * @param route_id NSInteger
 * @param completion A result completion block (NSMutableArray)
 */
+ (void)requestListNaviWithRoute:(NSInteger)route_id completion:(void (^)(id response))complete;
/*!
 * @brief delete navi data
 * @param route_id NSInteger
 */
+ (BOOL)requestDeleteNaviByRouteID:(NSNumber*)route_id;
@end
