//
//  JKUser.h
//  JKLoginMVVMDemo
//
//  Created by Jayesh Kawli Backup on 7/9/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKUser : NSObject

@property (nonatomic, copy, readonly) NSString* firstName;
@property (nonatomic, copy, readonly) NSString* lastName;

- (instancetype)initWithDictionary:(NSDictionary*)userDictionary;

@end
