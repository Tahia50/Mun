//
//  RouteManager.h
//  SDKLibrary
//
//  Created by  on 12/11/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RouteResult.h"

@interface RouteManager : NSObject

+ (NSNumber *)totalRoute;
+ (NSInteger)saveRootWithRoute:(NSDictionary *)routeData;
/*!
 * @brief save route information to local database
 * @param routeObj RouteResult: route object with information!
 */
+ (NSInteger)saveRouteWithObject:(id)routeObj routeName:(NSString *)route_name;
/*!
 * @brief get list route information from local database
 * @param routeObj RouteResult: route object with information!
 * @param completion A result completion block (NSMutableArray,NSDictionary)
 */
+ (void)requestListRouteWithcompletion:(void (^)(id response))complete;
/*!
 * @brief get list route information from local database
 * @param rId NSNumber: route object with information!
 * @param completion A result completion block (BOOL)
 */
+ (BOOL)requestDeleteRoute:(NSNumber*)rId ;

@end
