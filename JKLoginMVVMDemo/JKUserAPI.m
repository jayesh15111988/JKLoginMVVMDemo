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

+ (instancetype)sharedAPIManager {
    static JKUserAPI* shareAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareAPI = [[JKUserAPI alloc] init];
    });
    return shareAPI;
}
- (RACSignal*)userWithDictionary:(NSDictionary*)userDictionary {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        double delayInSeconds = 1.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [subscriber sendNext:[[JKUser alloc] initWithDictionary:userDictionary]];
            [subscriber sendCompleted];
        });
        return nil;
    }];
}

@end
