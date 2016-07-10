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

// A loginButtonActionCommand associated with login button on login home page.
@property (nonatomic, strong) RACCommand* loginButtonCommandAction;
// A flag to indicate if input is valid. Unless input is valid, login button is disabled and alpha is set to 0.5
@property (nonatomic, assign) BOOL loginInputValid;
// A flag to indicate that if API request is in progress. It will fire an UIActivityIndicator loader on the login page.
@property (nonatomic, assign) BOOL userLoadingInProgress;

// Properties associated with login user
@property (nonatomic, copy) NSString* firstName;
@property (nonatomic, copy) NSString* lastName;

// Logged in user is set once request is complete and we create a JKUser object with data received from the server
@property (nonatomic, strong) JKUser* loggedInUser;

@end
