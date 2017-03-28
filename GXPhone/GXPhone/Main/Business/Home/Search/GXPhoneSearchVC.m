//
//  GXPhoneSearchVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneSearchVC.h"

@interface GXPhoneSearchVC ()

@end

@implementation GXPhoneSearchVC


- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"home_discovery_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_discovery_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
