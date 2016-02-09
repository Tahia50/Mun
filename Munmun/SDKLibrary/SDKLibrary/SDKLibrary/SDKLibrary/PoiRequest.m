
//
//  PoiRequest.m
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "PoiRequest.h"
#import "ServiceLib.h"
#import "PoiWord.h"
#import "PoiGenre.h"
#import "ModelParamsDefine.h"
#import "DbSchemaDefine.h"
#import "DBManager.h"
#import "Libs.h"
#import "Language.h"
#import "PoiHistory.h"
#import "PoiFavourite.h"
#import "AddressLocation.h"
#import "Address.h"
#define SEARCH_POI_AROUND_PATH     @"poi/latlon.php"
#define SEARCH_POI_AROUND_URL      ([NSString stringWithFormat:@"%@%@", BASE_SDK_URL, SEARCH_POI_AROUND_PATH])
//ngocdu task871
#define SEARCH_POI_AROUND_URL_HARD_CODE      @"http://192.168.1.7/address/poiword"
//end
@implementation PoiRequest

+ (void)newPoiByWorldRequest:(NSString *)url
                  completion:(void (^)(NSMutableArray *pois))complete
                     failure:(void (^)(NSError *error))failure {
    @autoreleasepool {
        [ServiceLib sendGetRequest:url
                        completion:^(NSString *response) {
                            // TODO: gerenate sub gerne object;
                            __autoreleasing NSError *error = nil;
                            id result = [NSJSONSerialization
                                         JSONObjectWithData:[response
                                                             dataUsingEncoding:NSUTF8StringEncoding]
                                         options:kNilOptions
                                         error:&error];
                            NSMutableArray *retVal = [[NSMutableArray alloc] init];
                            // Be careful here. You add this as a category to NSDictionary
                            // but you get an id back, which means that result
                            // might be an NSArray as well!
                            if (error != nil) {
                                failure(error);
                                return;
                            }
                            NSMutableArray *arrPoi = [result objectForKey:@"item"];
                            for (int i = 0; i < arrPoi.count; i++) {
                                [retVal addObject:[[PoiWord alloc]
                                                   initWithDictionary:[arrPoi objectAtIndex:i]]];
                            }
                            complete(retVal);
                        }
                           failure:^(NSError *error) {
                               failure(error);
                           }];
    }
}

+ (void)requestPoiByLatlon:(NSDictionary*)params
                completion: (void (^)(NSMutableArray*))complete
                  failure :(void (^)(NSError*))failure {
    @autoreleasepool {
        //ngocdu task871
//        [ServiceLib sendRequest:SEARCH_POI_AROUND_URL params:params completion:^(NSString *response)
         //new code
        NSString *url = SEARCH_POI_AROUND_URL;
#if LOCAL_API
        url = SEARCH_POI_AROUND_URL_HARD_CODE;
        params = nil;
#endif
        [ServiceLib sendRequest:url params:params completion:^(NSString *response) {
         //end
            //TODO: gerenate sub gerne object;
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];

            NSMutableArray *array = [[NSMutableArray alloc] init];
            if (jsonDict && [jsonDict isKindOfClass:[NSDictionary class]]) {
                NSInteger hit = [[jsonDict objectForKey:@"hit"] integerValue];
                //ngocdu task871
//                NSArray *arr = [jsonDict objectForKey:@"poi"];
                //new code
                NSArray *arr = [jsonDict objectForKey:@"item"];
                //end
                if (arr && [arr isKindOfClass:[NSArray class]]) {
                    for (int i = 0 ; i < [arr count] ; i++) {
                        //remove object none infomation
                        //ngocdu task871
//                        if ([[[arr objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"00000000"])
                        //new code
                        if ([[[arr objectAtIndex:i] objectForKey:@"id"] isEqualToString:@"00000000"]) {
                        //end
                            continue;
                        }
                        //ngocdu task871
//                        PoiAround *poi = [[PoiAround alloc] initWithDictionary:[arr objectAtIndex:i]];
//                        [poi setHit:hit];
                        //new code
                        Poi *poi = [[Poi alloc] initItemNew:[arr objectAtIndex:i] withType:SearchTypeNone];
                        //end
                        [array addObject:poi];
                    }
                }
            }
            complete(array);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

+ (void)newPoiByWorldRequest:(NSString *)url
                      params:(NSDictionary *)params
                  completion:(void (^)(NSMutableArray *pois))complete
                     failure:(void (^)(NSError *error))failure {
    @autoreleasepool {
        [ServiceLib sendRequest:url
                         params:params
                     completion:^(NSString *response) {
                         // TODO: gerenate sub gerne object;
                         __autoreleasing NSError *error = nil;
                         id result = [NSJSONSerialization
                                      JSONObjectWithData:[response
                                                          dataUsingEncoding:NSUTF8StringEncoding]
                                      options:kNilOptions
                                      error:&error];
                         NSMutableArray *retVal = [[NSMutableArray alloc] init];
                         // Be careful here. You add this as a category to NSDictionary
                         // but you get an id back, which means that result
                         // might be an NSArray as well!
                         if (error != nil) {
                             failure(error);
                             return;
                         }
                         NSMutableArray *arrPoi = [result objectForKey:@"item"];
                         for (int i = 0; i < arrPoi.count; i++) {
                             [retVal addObject:[[PoiWord alloc]
                                                initWithDictionary:[arrPoi objectAtIndex:i]]];
                         }
                         complete(retVal);
                     }
                        failure:^(NSError *error) {
                            failure(error);
                        }];
    }
}

+ (void)startRequestWithUrlString:(NSString *)urlString params:(NSMutableDictionary *)params completion:(void (^)(id response))complete failure:(void (^)(NSError *error))failure {
    @autoreleasepool {
        if (!params) {
            params = [NSMutableDictionary new];
        }
        [params setValue:TOKYO forKey:kDatum];
        [ServiceLib sendRequest:urlString
                         params:params
                     completion:^(NSString *responseString) {
                         // TODO: gerenate sub gerne object;
                         __autoreleasing NSError *error = nil;
                         id result = [NSJSONSerialization
                                      JSONObjectWithData:[responseString
                                                          dataUsingEncoding:NSUTF8StringEncoding]
                                      options:kNilOptions
                                      error:&error];
                         if (error != nil) {
                             failure(error);
                             return;
                         }
                         if ([[[result objectForKey:kStatusCode] objectForKey:kCode] isEqualToString:kStatusCodeSuccess]) {
                             NSLog(@"urlReqeust %@", urlString);
                             complete(result);
                         } else {
                             failure(error);
                         }
                     }
                        failure:^(NSError *error) {
                            failure(error);
                        }];
    }
}

+ (void)startRequestWithUrlString:(NSString *)urlString params:(NSMutableDictionary *)params searchType:(SearchType)searchType completion:(void (^)(id response))complete failure:(void (^)(NSError *error))failure {
    @autoreleasepool {
        if (!params) {
            params = [NSMutableDictionary new];
        }
        [ServiceLib sendRequest:urlString
                         params:params
                     completion:^(NSString *responseString) {
                         // TODO: gerenate sub gerne object;
                         __autoreleasing NSError *error = nil;
                         id result = [NSJSONSerialization
                                      JSONObjectWithData:[responseString
                                                          dataUsingEncoding:NSUTF8StringEncoding]
                                      options:kNilOptions
                                      error:&error];
                         if (error != nil) {
                             failure(error);
                             return;
                         }
                         if ([[[result objectForKey:kStatusCode] objectForKey:kCode] isEqualToString:kStatusCodeSuccess]) {
                             complete(result);
                         } else {
                             failure(error);
                         }
                     }
                        failure:^(NSError *error) {
                            failure(error);
                        }];
    }
}

+ (void)requestFreewordSearchWithType:(SearchType)searchType
                               params:(NSMutableDictionary *)params
                          completion:(void (^)(id response))complete
                             failure:(void (^)(NSError *error))failure {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBASE_URL_FREEWORD, kAPI_FREEWORD];
    @autoreleasepool {
        if (!params) {
            params = [NSMutableDictionary new];
        }
        [ServiceLib sendRequest:urlString
                         params:params
                     completion:^(NSString *responseString) {
                         // TODO: gerenate sub gerne object;
                         __autoreleasing NSError *error = nil;
                         id result = [NSJSONSerialization
                                      JSONObjectWithData:[responseString
                                                          dataUsingEncoding:NSUTF8StringEncoding]
                                      options:kNilOptions
                                      error:&error];
                         if (error != nil) {
                             failure(error);
                             return;
                         }
                         NSArray *addrArray = [Poi getListPoiFromResponseAPI:[result objectForKey:kAddress] searchType:SearchTypeAddress];
                         NSDictionary *addressDict = @{kItem:addrArray, kInfo:[[result objectForKey:kAddress] objectForKey:kInfo]};
                         
                         NSArray *phoneArray = [Poi getListPoiFromResponseAPI:[result objectForKey:kPhoneNumber] searchType:SearchTypePhoneNumber];
                         NSDictionary *phoneDict = @{kItem:phoneArray, kInfo:[[result objectForKey:kPhoneNumber] objectForKey:kInfo]};
                         
                         NSArray *poiArray = [Poi getListPoiFromResponseAPI:[result objectForKey:kPoi] searchType:SearchTypeShop];
                         NSDictionary *poiDict = @{kItem:poiArray, kInfo:[[result objectForKey:kPoi] objectForKey:kInfo]};
                         
                         NSArray *ekiArray = [Poi getListPoiFromResponseAPI:[result objectForKey:kEki] searchType:SearchTypeStation];
                         NSDictionary *ekiDict = @{kItem:ekiArray, kInfo:[[result objectForKey:kEki] objectForKey:kInfo]};
                         complete(@{kAddress:addressDict, kPhoneNumber:phoneDict, kPoi:poiDict, kEki:ekiDict});
                     }
                        failure:^(NSError *error) {
                            failure(error);
                        }];
    }
}

+ (void)requestPoiByGenreCode:(NSDictionary*)params
                   completion: (void (^)(NSMutableArray*))complete
                     failure :(void (^)(NSError*))failure {
    @autoreleasepool {
        NSString *url = [NSString stringWithFormat:@"%@%@",BASE_SDK_URL,SEARCH_POI_GENRE_CODE_PATH];
#if LOCAL_API
            url = SEARCH_POI_AROUND_URL_HARD_CODE;
            params = nil;
#endif
        [ServiceLib sendRequest:url params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
            
            NSMutableArray *array = [[NSMutableArray alloc] init];
            if ([jsonDict isKindOfClass:[NSDictionary class]]) {
                NSArray *arr = [jsonDict objectForKey:kItem];
                if (arr && [arr isKindOfClass:[NSArray class]]) {
                    for (int i = 0 ; i < [arr count] ; i++) {
                        if ([[[arr objectAtIndex:i] objectForKey:kId] isEqualToString:@"00000000"]) {
                            continue;
                        }
                        Poi *poi = [[Poi alloc] initItemNew:[arr objectAtIndex:i] withType:SearchTypeNone];
                        [array addObject:poi];
                    }
                }
            }
            complete(array);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

+ (NSNumber*)toTalFavourite {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectCountFavourite];
    if (!results || results.count == 0) {
        return [NSNumber numberWithInteger:0];
    }
    NSDictionary *obj = [results objectAtIndex:0];
    results = nil;
    return [obj objectForKey: COUNT_];
}

+ (NSNumber*)toTalHistory {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectCountHistory];
    if (!results || results.count == 0) {
        return [NSNumber numberWithInteger:0];
    }
    NSDictionary *obj = [results objectAtIndex:0];
    results = nil;
    return [obj objectForKey: COUNT_];
}

+ (void)insertOrUpdatePoi: (id) poi {
    if ([poi isKindOfClass:[PoiFavourite class]]) {
        PoiFavourite *pfavourite = (PoiFavourite*)poi;
        if ([PoiRequest hasItemFavourite:pfavourite]) {
            [pfavourite setAccessDate:[NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]]];
            [self updatePoiFavourite:pfavourite];
        }else{
            [self insertPoiFavourite:pfavourite];
        }
        return;
    }
    if ([poi isKindOfClass:[PoiDetail class]]) {
        PoiHistory *pHistory = [[PoiHistory alloc] initWithPoiDetail:poi];
        if ([PoiRequest hasItem:pHistory]) {
            [pHistory setAccessDate:[NSString stringWithFormat:@"%lld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] longLongValue]]];
            [self updatePoi:pHistory];
        }else{
            [self insertPoi:pHistory];
        }
        return;
    }
}

+ (BOOL) hasItem: (PoiHistory*) poi{
    if (!poi.code) {
        return NO;
    }
    return [DBManager hasItem: kSchemaCheckPoi withConditionval: poi.code];
}

+(BOOL) hasItemFavourite: (PoiFavourite*) poi{
    if (!poi.pId) {
        return NO;
    }
    return [DBManager hasItem: kSchemaCheckPoiFavourite withConditionval: poi.pId];
}

+ (void)insertPoiFavourite:(PoiFavourite*)poi{
    NSArray *keys = kPoiFavouriteCollums;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        if ([key isEqualToString:kFavourite]) {
            NSNumber *obj =[NSNumber numberWithInt:0];
            [vals addObject:obj];
            continue;
        }
        [vals addObject:[poi valueForKey:key]];
    }
    [DBManager executeUpdate:kSchemaInsertPoiFavourite withArgumens:vals];
}

+ (void)updatePoiFavourite: (PoiFavourite *)poi{
    NSArray *keys = kPoiFavouriteCollums;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        [vals addObject:[poi valueForKey:key]];
    }
    [vals addObject:[poi valueForKey:kPId]];
    [DBManager executeUpdate:kSchemaUpdatePoiFavourite withArgumens:vals];
}

+ (void)insertPoi:(PoiHistory*)poi {
    NSNumber *count = [PoiRequest toTalHistory];
    if ([count integerValue] >= kLimitHistory) {
        PoiHistory *firstPoi = [PoiRequest getFirstPoi];
        [PoiRequest requestDeletePoi:[firstPoi code] completion:^(BOOL ok) {

        }];
        firstPoi = nil;
    }
    NSArray *keys = kPoiCollums;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        if ([key isEqualToString:kFavourite]) {
            NSNumber *obj =[NSNumber numberWithInt:0];
            [vals addObject:obj];
            continue;
        }
        [vals addObject:[poi valueForKey:key]];
    }
    [DBManager executeUpdate:kSchemaInsertPoi withArgumens:vals];
}

+ (void)updatePoi: (PoiHistory *)poi {
    NSArray *keys = kPoiCollums;
    NSMutableArray *vals = [NSMutableArray array];
    for (NSString *key in keys) {
        [vals addObject:[poi valueForKey:key]];
    }
    [vals addObject:[poi valueForKey:kCode]];
    [DBManager executeUpdate:kSchemaUpdatePoi withArgumens:vals];
}

+ (void)requestDeletePoi: (id)poi completion:(void (^)(BOOL ok))complete {
    NSString *code = (NSString*) poi;
    NSMutableArray *vals = [NSMutableArray array];
    [vals addObject:code];
    BOOL ok = [DBManager executeUpdate:kSchemaDeletePoi withArgumens:vals];
    complete(ok);
}

+ (void)requestDeletePoiFavourite: (NSNumber*)pId completion:(void (^)(BOOL ok))complete {
    NSMutableArray *vals = [NSMutableArray array];
    [vals addObject:pId];
    BOOL ok = [DBManager executeUpdate:kSchemaDeletePoiFavourite withArgumens:vals];
    complete(ok);
}

+ (NSMutableArray*)getHistoryPoi : (NSNumber*)page {
    if ([page integerValue] == 0) {
        page = [NSNumber numberWithInteger:0];
    } else {
        page = [NSNumber numberWithInteger:[page integerValue] -1];
    }
    NSString *schemaLimit = [NSString stringWithFormat:kSelectLiMit, kDefaultLimitPage, [page integerValue]* kDefaultLimitPage];
    NSString *schema = [NSString stringWithFormat:@"%@ %@", kSchemaSelectPoi, schemaLimit];
    NSMutableArray *results = [DBManager executeQuerry:schema];
    NSMutableArray *pois = [[NSMutableArray alloc] init];
    for (id result in results) {
        [pois addObject:[[PoiHistory alloc] initWithDictionary:result]];
    }
    return pois;
}

+ (NSMutableArray*)getFavouritePoi : (NSNumber*)page {
    if ([page integerValue] == 0) {
        page = [NSNumber numberWithInteger:0];
    } else {
        page = [NSNumber numberWithInteger:[page integerValue] -1];
    }
    NSString *schemaLimit = [NSString stringWithFormat:kSelectLiMit,kDefaultLimitPage,kDefaultLimitPage*[page integerValue]];
    NSString *schema = [NSString stringWithFormat:@"%@ %@",kSchemaSelectPoiFavourite,schemaLimit];
    NSMutableArray *results = [DBManager executeQuerry:schema];
    NSMutableArray *pois = [[NSMutableArray alloc] init];
    for (id result in results) {
        [pois addObject:[[PoiFavourite alloc] initWithDictionary:result]];
    }
    return pois;
}

+ (NSMutableArray*)getAllFavouritePoi {
    NSString *schema = [NSString stringWithFormat:@"%@",kSchemaSelectPoiFavourite];
    NSMutableArray *results = [DBManager executeQuerry:schema];
    NSMutableArray *pois = [[NSMutableArray alloc] init];
    for (id result in results) {
        [pois addObject:[[PoiFavourite alloc] initWithDictionary:result]];
    }
    return pois;
}

+ (PoiFavourite*) getPoiFavouriteById:(NSNumber*) code {
    if(!code) {
        return nil;
    }
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectPoiFavouriteByCode withConditionval:[NSArray arrayWithObject:code]];
    if (!results || results.count == 0) {
        return nil;
    }
    return [[PoiFavourite alloc] initWithDictionary:[results objectAtIndex:0]];
}

+ (PoiFavourite*)getFirstPoiFavourite {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectFirstPoiFavourite];
    if (!results || results.count == 0) {
        return nil;
    }
    return [[PoiFavourite alloc] initWithDictionary:[results objectAtIndex:0]];
}

+ (PoiFavourite*)getLastPoiFavourite {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectLastPoiFavourite];
    if (!results || results.count == 0) {
        return nil;
    }
    return [[PoiFavourite alloc] initWithDictionary:[results objectAtIndex:0]];
}

+ (PoiHistory*)getFirstPoi {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectFirstPoi];
    if (!results || results.count == 0) {
        return nil;
    }
    return [[PoiHistory alloc] initWithDictionary:[results objectAtIndex:0]];
}

+ (NSMutableArray*)getFavouritePoiByGroup : (NSNumber*)gId {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectPoiFavouriteByGroup withConditionval:[NSArray arrayWithObject:gId]];
    NSMutableArray *pois = [[NSMutableArray alloc] init];
    for (id result in results) {
        [pois addObject:[[PoiFavourite alloc] initWithDictionary:result]];
    }
    return pois;
}

+ (void)requestFavouriteWithcompletion:(void (^)(id response))complete {
    NSMutableArray *results = [DBManager executeQuerry:kSchemaSelectPoiFavourite withConditionval:[NSArray arrayWithObjects:FAVOURITE, nil]];
    NSMutableArray *pois = [[NSMutableArray alloc] init];
    for (id result in results) {
        [pois addObject:[[Poi alloc] initItem:result]];
    }
    complete (results);
}

+ (void)requestGetRaster:(NSMutableDictionary *)params completion:(void (^)(id response))complete failure:(void (^)(NSError *error))failure {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBASE_URL, kAPI_GET_RASTER_IMG];
    if (!params) {
        params = [NSMutableDictionary new];
    }
    [params setValue:[Language getCurrentLangCode] forKey:kLanguage];
    [self startRequestWithUrlString:urlString params:params completion:^(id response) {
        complete(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
