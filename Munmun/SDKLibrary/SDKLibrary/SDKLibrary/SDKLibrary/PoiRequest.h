//
//  PoiRequest.h
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"
#import "Poi.h"
#import "ModelParamsDefine.h"
#import "PoiFavourite.h"
#import "PoiHistory.h"
#import "PoiGenre.h"

@interface PoiRequest : NSObject

+ (void)newPoiByWorldRequest:(NSString *)url
                  completion:(void (^)(NSMutableArray *pois))complete
                     failure:(void (^)(NSError *error))failure;

+ (void)newPoiByWorldRequest:(NSString *)url
                      params:(NSDictionary*)params
                  completion:(void (^)(NSMutableArray *pois))complete
                     failure:(void (^)(NSError *error))failure;

+ (void)startRequestWithUrlString:(NSString *)urlString
                           params:(NSMutableDictionary *)params
                       completion:(void (^)(id response))complete
                          failure:(void (^)(NSError *error))failure;
/*!
* @brief Request Poi by latlon api and then execute result block
* @param params NSDictionary: paramaters to request.
* @param completion A result completion block (NSMutableArray,NSDictionary)
* @param failure A result failure block (NSError)
* @code       [AddressRequest requestAddressByLatlon:params
                                          completion:^(NSMutableArray *result)
               {
               }
                                             failure:^(NSError *error)
               {
               }];
*/
+ (void)requestPoiByLatlon:(NSDictionary*)params
                completion: (void (^)(NSMutableArray*))complete
                  failure :(void (^)(NSError*))failure;
/*!
 * @brief Request freeword api and then execute result block
 * @param searchType SearchType enum
 * @param params NSDictionary: paramaters to request.
 * @param completion A result completion block (NSMutableArray,NSDictionary)
 * @param failure A result failure block (NSError)
 * @code [PoiRequest requestFreewordSearchWithType:SearchTypeStation params:params completion:^(id response, NSDictionary *info) {
 // TODO something
 } failure:^(NSError *error) {
 // TODO something
 }];
 */
+ (void)requestFreewordSearchWithType:(SearchType)searchType
                               params:(NSMutableDictionary *)params
                           completion:(void (^)(id response))complete
                              failure:(void (^)(NSError *error))failure;
/*!
 * @brief Request poi by gerne code api and then execute result block
 * @param params NSDictionary: paramaters to request.
 * @param completion A result completion block (NSMutableArray,NSDictionary)
 * @param failure A result failure block (NSError)
 * @code  [PoiRequest requestPoiByGenreCode:params
                                 completion:^(NSMutableArray *result){
                                    // TODO something
                                 }
                                 failure:^(NSError *error){
                                    // TODO something
                                 }];
 */
+ (void)requestPoiByGenreCode:(NSDictionary*)params
                   completion: (void (^)(NSMutableArray*))complete
                     failure :(void (^)(NSError*))failure;

+ (NSNumber*)toTalFavourite;
/*!
 * @brief Insert poi to database, if poi exist , update poi data.
 * @param params poi: PoiDetail object if insert to History and Poi Favourite if insert favourite.
 * @code  [PoiRequest insertOrUpdatePoi:pDetail];
 */
+ (void)insertOrUpdatePoi: (id)poi;
+ (void)insertPoi: (id)poi;
+ (void)updatePoi: (id)poi;
/*!
 * @brief Request delete poi  and then execute result block
 * @param poi NSNumber: poi code
 * @param completion A result completion block (BOOL ok)
 * @code [PoiRequest requestDeletePoi completion:^(BOOL ok) {
 }];
 */
+ (void)requestDeletePoi: (id)poi completion:(void (^)(BOOL ok))complete;
/*!
 * @brief Request delete poi favourite and then execute result block
 * @param poi NSNumber: poi code
 * @param completion A result completion block (BOOL ok)
 * @code [PoiRequest requestDeletePoiFavourite:code completion:^(BOOL ok) {
 }];
 */
+ (void)requestDeletePoiFavourite: (NSNumber*)poi completion:(void (^)(BOOL ok))complete;
+ (PoiFavourite*) getPoiFavouriteById:(NSNumber*) code ;
/*!
 * @brief get list History Poi.
 * @code  [PoiRequest getHistoryPoi];
 */
+ (NSMutableArray*)getHistoryPoi : (NSNumber*)page;
/*!
 * @brief get list Favourite Poi.
 * @code  [PoiRequest getFavouritePoi];
 */
+ (NSMutableArray*)getFavouritePoi : (NSNumber*)page;
+ (NSMutableArray*)getAllFavouritePoi ;
+ (NSMutableArray*)getFavouritePoiByGroup : (NSNumber*)gId;
+ (PoiFavourite*)getFirstPoiFavourite;
+ (PoiFavourite*)getLastPoiFavourite;
+ (PoiHistory*)getFirstPoi;
+ (NSNumber*)toTalHistory;
+ (void)requestFavouriteWithcompletion:(void (^)(id response))complete;
+ (void)requestGetRaster:(NSMutableDictionary *)params completion:(void (^)(id response))complete failure:(void (^)(NSError *error))failure;
@end
