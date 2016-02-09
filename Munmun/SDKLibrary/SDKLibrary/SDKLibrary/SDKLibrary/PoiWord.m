//
//  PoiWord.m
//  SDKLibrary
//
//  Created by  on 11/18/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import "PoiWord.h"

@implementation PoiWord
-(id)initWithDictionary:(NSDictionary*)dict{
    if(self = [super init]){
        if(dict && [dict objectForKey:@"text"]){
            self.text = [dict objectForKey:@"text"];
        }
        if(dict && [dict objectForKey:@"code"]){
            self.code = [dict objectForKey:@"code"];
        }
        if(dict && [dict objectForKey:@"gerne"]){
            self.gerne = [[Gerne alloc] initWithDictionary:[dict objectForKey:@"gerne"]];
        }
    }
    return self;
}
@end
