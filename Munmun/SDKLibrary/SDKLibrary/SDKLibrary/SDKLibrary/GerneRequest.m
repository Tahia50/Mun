   //
//  GerneRequest.m
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "GerneRequest.h"
#import "Libs.h"
#import "ServiceLib.h"
#import "Language.h"
#import "Address.h"
#import "ErrorUtils.h"
//ngocdu task676
#define NUMBER_START 1
#define NUMBER_END 3
#define NUMBER_CONTINUE_START 1
#define NUMBER_CONTINUE_END 6
#define SEARCH_POI_GENRE_CODE_URL_HARD_CODE      @"192.168.1.7/address/poiword"
#define PARAM_HARD_CODE      nil
#define NSRangeIsValid(e) (e.location == NSNotFound)
//end
@implementation GerneRequest

+(void)requestGerne:(void (^)(NSMutableArray *))callBack{
    @autoreleasepool {
        NSMutableArray *retVal = [[NSMutableArray alloc] init];
        NSDictionary *gerneDict = [Libs dictionaryWithContentsOfJSONString:@"Gerne.json"];
        NSMutableArray *categories = [[NSMutableArray alloc] init];
        [categories addObjectsFromArray:[gerneDict objectForKey:@"listCategory"]];
        for (int i = 0; i< categories.count; i++) {
            [retVal addObject:[[Gerne alloc] initWithDictionary:[categories objectAtIndex:i]]];
        }
        callBack(retVal);
    }
}

+ (void)requestSubGerne: (NSDictionary*)params
             completion: (void (^)(NSMutableArray*))complete
               failure :(void (^)(NSError*))failure{
    @autoreleasepool {
        NSString *url = [NSString stringWithFormat:@"%@%@",BASE_SDK_URL,SEARCH_POI_GENRE_CODE_PATH];
        [ServiceLib sendRequest:url params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            NSString *jsonString = [Libs htmlEntityDecode:response];
            jsonString = [jsonString stringByReplacingOccurrencesOfString:@" " withString:@""];
            jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
            jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            NSDictionary *dict = [Libs convertStringToDictionary:jsonString];
            NSString *currentLang = [Language getCurrentLangCode];
            if ([currentLang isEqualToString:LANGUAGE_DEFAULT]) {
                if( !dict || ![dict objectForKey:kInfo] || ![[dict objectForKey:kInfo] objectForKey:kFacet]
                    || ![[[dict objectForKey:kInfo] objectForKey:kFacet] objectForKey:kGenre] ) {
                    failure([ErrorUtils defaultError]);
                    return ;
                }
                complete([self genreArrayFromDict:[[[dict objectForKey:kInfo] objectForKey:kFacet] objectForKey:kGenre]]);
                return ;
            }
            if( !dict || ![dict objectForKey:kInfo] || ![[dict objectForKey:kInfo] objectForKey:kFacet]
                || ![[[dict objectForKey:kInfo] objectForKey:kFacet] objectForKey:kGenreMlang]
                || ![[[[dict objectForKey:kInfo] objectForKey:kFacet] objectForKey:kGenreMlang] objectForKey:currentLang]) {
                failure([ErrorUtils defaultError]);
                return ;
            }
            complete([self genreArrayFromDict:[[[[dict objectForKey:kInfo] objectForKey:kFacet] objectForKey:kGenreMlang] objectForKey:currentLang]]);
            return ;
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

+ (NSMutableArray*) genreArrayFromDict: (NSDictionary*)genreObjs {
    NSMutableArray *array = [NSMutableArray new];
    __block NSDictionary *genrneObj;
    NSArray *keys = [genreObjs allKeys];
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [(NSString *)obj1 compare:(NSString *)obj2 options:NSNumericSearch];
    }];
    for (NSString *key in keys) {
        genrneObj = @{kGenreCode : key, kText : [[[genreObjs objectForKey:key] objectForKey:kText] lastPathComponent]};
        [array addObject:[[SubGerne alloc] initWithDictionary:genrneObj]];
    }
    return array;
}

//ngocdu task676
+(NSArray*)getArrayGenre: (NSString*)string
{
    NSMutableArray *array = [[NSMutableArray alloc] init];

    NSString *prefix = @"},";
    NSString *needle;
    NSData *jsonDataNew;
    NSDictionary *values;
    NSArray *arr = [string componentsSeparatedByString:prefix];
    for (int i = 0; i < [arr count]; i ++) {
        needle = [NSString stringWithFormat:@"{%@}}", arr[i]] ;
        if (i == [arr count] - 1) {
            needle = [NSString stringWithFormat:@"{%@}", arr[i]] ;
        }
        jsonDataNew = [needle dataUsingEncoding:NSUTF8StringEncoding];
        values = [NSJSONSerialization JSONObjectWithData:jsonDataNew options:NSJSONReadingMutableContainers error:nil];

        [array insertObject:values atIndex:i];
        needle = nil;
        jsonDataNew = nil;
        values = nil;
    }
    return array;
}
//end

+ (void)requestAddress:(NSDictionary*)params
                 level: (AddressLevel)level
            completion: (void (^)(NSMutableArray*result))complete
              failure :(void
                        (^)(NSError*error))failure {
    @autoreleasepool {
        NSString *url = [NSString stringWithFormat:@"%@%@", BASE_SDK_URL, SEARCH_POI_GENRE_CODE_PATH];
#ifdef LOCAL_API
        url = SEARCH_POI_GENRE_CODE_URL_HARD_CODE;
        params = nil;
#endif
        [ServiceLib sendRequest:url params:params completion:^(NSString *response) {
            //TODO: gerenate sub gerne object;
            NSString *jsonString = [Libs htmlEntityDecode:response];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];

            NSMutableArray *array = [NSMutableArray array];

            NSDictionary *dict = [jsonDict objectForKey:kInfo];
            if (!dict ||
                ![dict isKindOfClass:[NSDictionary class]]) {
                complete(array);
                return;
            }
            dict = [dict objectForKey:kFacet];
            if (!dict ||
                ![dict isKindOfClass:[NSDictionary class]]) {
                complete(array);
                return;
            }
            NSString *levelStr = [GerneRequest stringFromLevel:level];
            dict = [dict objectForKey:levelStr];
            if (!dict ||
                ![dict isKindOfClass:[NSDictionary class]]) {
                complete(array);
                return;
            }
            NSString *currentLang = [Language getCurrentLangCode];
            if (![currentLang isEqualToString:LANGUAGE_DEFAULT]) {
                dict = [dict objectForKey:currentLang];
                if (!dict ||
                    ![dict isKindOfClass:[NSDictionary class]]) {
                    complete(array);
                    return;
                }
            }
            NSArray *keys = [Libs sortedKeysFromDict:dict];
            Address *address;
            for (NSString *key in keys) {
                address = [[Address alloc] init];
                address.count = [[[dict objectForKey:key] objectForKey:kCount] integerValue];
                address.code = key;
                address.text =  (level == TOD) ? [[[dict objectForKey:key] objectForKey:kText] firstObject]
                :[[[dict objectForKey:key] objectForKey:kText] lastObject];
                [array addObject:address];
            }
            address = nil;
            complete(array);
        } failure:^(NSError *error) {
            failure(error);
        }];
    }
}

+ (void)parser:(NSArray*)arr toObject:(Address*)address {
    if (!arr ||
        ![arr isKindOfClass:[NSArray class]]) {
        return;
    }
    if ([arr count] != 4) {
        return;
    }

    NSString *parentCode = [[arr objectAtIndex:0] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *parentText = [[arr objectAtIndex:1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *addrCode = [[arr objectAtIndex:2] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *addrText = [[arr objectAtIndex:3] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    address.parentCode = parentCode;
    address.parentText = parentText;
    address.code = addrCode;
    address.text = addrText;
}

+ (NSString*) stringFromLevel: (AddressLevel)level {
    NSString *str = kLevelList[level];
    NSString *currentLang = [Language getCurrentLangCode];
    if ([currentLang isEqualToString:LANGUAGE_DEFAULT]) {
        return str;
    }
    str = kLevelLangList[level];
    return str;
}

@end
