//
//  ViewController.h
//  JKLoginMVVMDemo
//
//  Created by Jayesh Kawli Backup on 7/9/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKLoginViewModel;

@interface ViewController : UIViewController

- (instancetype)initWithViewModel:(JKLoginViewModel*)viewModel;

@end

