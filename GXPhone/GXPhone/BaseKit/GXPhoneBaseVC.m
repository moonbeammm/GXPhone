//
//  GXPhoneBaseVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneBaseVC.h"

@interface GXPhoneBaseVC ()
{
    BOOL _firstWillAppeared;
}
@end

@implementation GXPhoneBaseVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!_firstWillAppeared) {
        [self bili_viewfirstWillAppear];
        _firstWillAppeared = YES;
    }
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)bili_viewfirstWillAppear
{
    // 第一次显示的时候想做的操作.
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"%@ 收到了内存警告!",NSStringFromClass([self class]));
}

- (void)dealloc
{
    NSLog(@"%@ released", NSStringFromClass([self class]));
}

@end
