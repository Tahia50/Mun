//
//  Location.h
//  SDKLibrary
//
//  Created by  on 11/20/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "Poi.h"
#import "Config.h"

@interface AddressLocation : Poi

+(AddressLocation*)lastAddresLocation;

- (id)initWithDictionary:(NSDictionary *)dict;
+ (void)setLastAddessToEmpty ;

@end
