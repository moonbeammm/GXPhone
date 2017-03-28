//
//  GXPhoneUserVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneUserVC.h"

@interface GXPhoneUserVC ()

@end

@implementation GXPhoneUserVC

- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"home_mine_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_mine_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
