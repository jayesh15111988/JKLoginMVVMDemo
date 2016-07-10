//
//  ViewController.m
//  JKLoginMVVMDemo
//
//  Created by Jayesh Kawli Backup on 7/9/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import "JKUser.h"
#import "JKLoginViewModel.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) JKLoginViewModel* viewModel;
@property (nonatomic, strong) UIActivityIndicatorView* activityIndicatorView;

@end

@implementation ViewController

- (instancetype)initWithViewModel:(JKLoginViewModel *)viewModel {
    self = [super initWithNibName:nil bundle:nil];
    if (!self) { return nil; }
    
    _viewModel = viewModel;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Login";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] init];
    self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    self.activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.activityIndicatorView.color = [UIColor greenColor];
    [self.activityIndicatorView setHidesWhenStopped:YES];
    [self.view addSubview:self.activityIndicatorView];
    
    UITextField* firstNameField = [[UITextField alloc] init];
    firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
    firstNameField.placeholder = @"First Name";
    firstNameField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:firstNameField];
    
    UITextField* lastNameField = [[UITextField alloc] init];
    lastNameField.translatesAutoresizingMaskIntoConstraints = NO;
    lastNameField.placeholder = @"Last Name";
    lastNameField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:lastNameField];
    
    UIButton* loginButton = [[UIButton alloc] init];
    loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    loginButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    loginButton.layer.borderWidth = 1.0;
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    loginButton.rac_command = _viewModel.loginButtonCommandAction;
    [self.view addSubview:loginButton];
    
    UILabel* loggedInUserDetails = [[UILabel alloc] init];
    loggedInUserDetails.translatesAutoresizingMaskIntoConstraints = NO;
    loggedInUserDetails.textAlignment = NSTextAlignmentCenter;
    loggedInUserDetails.numberOfLines = 0;
    [self.view addSubview:loggedInUserDetails];
    
    [RACObserve(self.viewModel, loginInputValid) subscribeNext:^(id x) {
        loginButton.enabled = [x boolValue];
        loginButton.alpha = [x boolValue] ? 1.0 : 0.5;
    }];
    
    RAC(self, viewModel.firstName) = [firstNameField rac_textSignal];
    RAC(self, viewModel.lastName) = [lastNameField rac_textSignal];
    [[RACObserve(self.viewModel, loggedInUser) ignore:nil] subscribeNext:^(JKUser* x) {
        loggedInUserDetails.text = x.description;
    }];
    
    @weakify(self);
    [RACObserve(self.viewModel, userLoadingInProgress) subscribeNext:^(NSNumber* loading) {
        @strongify(self);
        if ([loading boolValue]) {
            [self.activityIndicatorView startAnimating];
        } else {
            [self.activityIndicatorView stopAnimating];
        }
    }];
    
    id topLayoutGuide = self.topLayoutGuide;
    NSDictionary* views = NSDictionaryOfVariableBindings(topLayoutGuide, firstNameField, lastNameField, loginButton, loggedInUserDetails);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide]-20-[firstNameField(30)]-[lastNameField(30)]-40-[loginButton(30)]-[loggedInUserDetails(>=0)]" options:kNilOptions metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[firstNameField]-|" options:kNilOptions metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[lastNameField]-|" options:kNilOptions metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[loginButton]-|" options:kNilOptions metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[loggedInUserDetails]-|" options:kNilOptions metrics:nil views:views]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_activityIndicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_activityIndicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
}

@end
