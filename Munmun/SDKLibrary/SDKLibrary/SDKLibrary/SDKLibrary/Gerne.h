//
//  Gerne.h
//  SDKLibrary
//
//  Created by  on 11/16/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubGerne : NSObject

@property(nonatomic,strong) NSString *m_subGenrName;
@property(nonatomic,strong) NSString *m_subGenrCode;
-(id)initWithDictionary:(NSDictionary*)dict;

@end

@interface Gerne : NSObject
@property(nonatomic,strong) NSDictionary *name;
@property(nonatomic,strong) NSString *genrecode;
-(id)initWithDictionary:(NSDictionary*)dict;

@end
