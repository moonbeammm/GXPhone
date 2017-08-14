//
//  GXPhoneHomeVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneHomeVC.h"


@interface GXPhoneHomeVC ()

@end

@implementation GXPhoneHomeVC

- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"home_home_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_home_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"首页";
        titleLabel.textColor = [UIColor blackColor];
        [self.navigationItem setTitleView:titleLabel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
