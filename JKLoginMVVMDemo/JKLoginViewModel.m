//
//  JKLoginViewModel.m
//  JKLoginMVVMDemo
//
//  Created by Jayesh Kawli Backup on 7/9/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import "JKUserAPI.h"
#import "JKLoginViewModel.h"

@implementation JKLoginViewModel

- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    
    _loginButtonCommandAction = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [[JKUserAPI sharedAPIManager] userWithDictionary:@{@"first_name": self.firstName, @"last_name": self.lastName}];
    }];
    
    @weakify(self);
    [[_loginButtonCommandAction.executionSignals flatten] subscribeNext:^(JKUser* x) {
        @strongify(self);
        self.loggedInUser = x;
    }];
    
    [_loginButtonCommandAction.executing subscribeNext:^(NSNumber* x) {
        @strongify(self);
        self.userLoadingInProgress = [x boolValue];
        self.loginInputValid = ![x boolValue];
    }];
    
    [_loginButtonCommandAction.errors subscribeNext:^(NSError* x) {
        NSLog(@"Error Occurred while logging user in %@", [x localizedDescription]);
    }];
    
    [[[RACSignal combineLatest:@[RACObserve(self, firstName), RACObserve(self, lastName)]] map:^NSNumber*(RACTuple* value) {
        return @([value[0] length] > 0 && [value[1] length] > 0);
    }] subscribeNext:^(id value) {
        self.loginInputValid = [value boolValue];
    }];
    
    return self;
}

@end
