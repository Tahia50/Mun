//
//  Gerne.m
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//
#import "Gerne.h"
#import "ModelParamsDefine.h"

@implementation SubGerne

- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.m_subGenrCode = [dict objectForKey:kGenreCode];
        self.m_subGenrName = [dict objectForKey:kText];
    }
    return self;
}

@end

@implementation Gerne

-(id)initWithDictionary:(NSDictionary *)dict{
    if(self = [super init]){
        if(dict && [dict objectForKey:kName]){
            self.name = [dict objectForKey:kName];
        }
        if(dict && [dict objectForKey:kGenreCode]){
            self.genrecode = [dict objectForKey:kGenreCode];
        }
    }
    return self;
}

@end
