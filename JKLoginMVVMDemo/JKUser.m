//
//  JKUser.m
//  JKLoginMVVMDemo
//
//  Created by Jayesh Kawli Backup on 7/9/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import "JKUser.h"

@implementation JKUser

- (instancetype)initWithDictionary:(NSDictionary*)userDictionary {
    self = [super init];
    if (!self) { return nil; }
    
    _firstName = userDictionary[@"first_name"];
    _lastName = userDictionary[@"last_name"];
    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"%@\n%@\n%@", self.firstName, self.lastName, @"2432sdad3123123ad323adada"];
}

@end
