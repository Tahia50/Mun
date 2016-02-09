//
//  Group.h
//  SDKLibrary
//
//  Created by MrKien on 11/29/15.
//  Copyright © 2015 SDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic, strong) NSNumber *groupId;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSString *groupName;

- (id) initWithName: (NSString*)name groupId: (NSNumber*) gId count : (NSNumber*)cnt;
- (id) initWithDictionary: (id) dict;

@end
