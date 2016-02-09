//
//  PoiWord.h
//  SDKLibrary
//
//  Created by  on 11/18/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gerne.h"

@interface PoiWord : NSObject
@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) NSString *code;
@property(nonatomic, strong) Gerne *gerne;
- (id)initWithDictionary:(NSDictionary *)dict;

@end
