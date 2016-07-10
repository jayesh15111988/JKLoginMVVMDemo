//
//  JKUserAPI.h
//  JKLoginMVVMDemo
//
//  Created by Jayesh Kawli Backup on 7/9/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Foundation/Foundation.h>

@interface JKUserAPI : NSObject

+ (instancetype)sharedAPIManager;
- (RACSignal*)userWithDictionary:(NSDictionary*)userDictionary;

@end
