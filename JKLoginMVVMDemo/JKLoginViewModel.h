//
//  JKLoginViewModel.h
//  JKLoginMVVMDemo
//
//  Created by Jayesh Kawli Backup on 7/9/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Foundation/Foundation.h>
@class JKUser;

@interface JKLoginViewModel : NSObject

@property (nonatomic, strong) RACCommand* loginButtonCommandAction;
@property (nonatomic, assign) BOOL loginInputValid;
@property (nonatomic, assign) BOOL userLoadingInProgress;
@property (nonatomic, copy) NSString* firstName;
@property (nonatomic, copy) NSString* lastName;
@property (nonatomic, strong) JKUser* loggedInUser;

@end
