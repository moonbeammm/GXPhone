//
//  GXPhoneTouchTwoVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/9/26.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneTouchTwoVC.h"

@interface GXPhoneTouchTwoVC ()

@end

@implementation GXPhoneTouchTwoVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"第二个";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
