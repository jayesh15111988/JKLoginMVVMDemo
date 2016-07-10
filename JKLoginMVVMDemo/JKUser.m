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
    // Properties associated with JKUser object.
    _firstName = userDictionary[@"first_name"];
    _lastName = userDictionary[@"last_name"];
    _authToken = userDictionary[@"auth_token"];
    return self;
}

// Custom description for our JKUser object.
- (NSString*)description {
    return [NSString stringWithFormat:@"%@\n%@\n%@", self.firstName, self.lastName, self.authToken];
}

@end
