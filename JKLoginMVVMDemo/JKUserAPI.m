//
//  JKUserAPI.m
//  JKLoginMVVMDemo
//
//  Created by Jayesh Kawli Backup on 7/9/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import "JKUser.h"
#import "JKUserAPI.h"

@implementation JKUserAPI

// We create a singleton shareAPIManager to handle all out API interactions.
+ (instancetype)sharedAPIManager {
    static JKUserAPI* shareAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareAPI = [[JKUserAPI alloc] init];
    });
    return shareAPI;
}

// Once we get userDictionary, we make (dummy) API call and assume API gives us all the information plus auth token back after login.
- (RACSignal*)userWithDictionary:(NSDictionary*)userDictionary {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // Delay is added on purpose to simulate API call.
        double delayInSeconds = 1.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            // Initialize the object JKUser with (dummy) dictionary object received from the server.
            [subscriber sendNext:[[JKUser alloc] initWithDictionary:@{@"first_name": userDictionary[@"first_name"], @"last_name": userDictionary[@"last_name"], @"auth_token": @"123adasdsadasdasdasdd"}]];
            [subscriber sendCompleted];
        });
        return nil;
    }];
}

@end
