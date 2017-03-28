//
//  GXMainTabBarViewController.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXMainTabBarViewController.h"
#import "GXPhoneHomeVC.h"
#import "GXPhoneCategoryVC.h"
#import "GXPhoneSearchVC.h"
#import "GXPhoneUserVC.h"

@interface GXMainTabBarViewController ()

@end

@implementation GXMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundColor:GXWhiteColor];
    self.view.backgroundColor = GXWhiteColor;
    [self configureChildVC];
}

- (void)configureChildVC
{
    NSArray * vcs = @[
                      [[GXPhoneHomeVC alloc] init],
                      [[GXPhoneCategoryVC alloc] init],
                      [[GXPhoneSearchVC alloc] init],
                      [[GXPhoneUserVC alloc] init]
                      ];
    [self setViewControllers:vcs animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

@end
