//
//  GXPhoneUserVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneUserVC.h"
#import <GXNetwork/GXNetworkManager.h>
#import <GXRuler/GXImage.h>

@interface GXPhoneUserVC ()

@end

@implementation GXPhoneUserVC

- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.image = GXImageMake(GXPhone,@"home_mine_tab");
        self.tabBarItem.selectedImage = GXImageMake(GXPhone,@"home_mine_tab_s");
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    GXNetworkManager * manager = [GXNetworkManager shared];
//    [manager GETWithUrl:@"http://www.mocky.io/v2/58f863ec110000170ea1739a"];
    
    
    UIImageView *imageView = [manager getImageView];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(100, 100, 100, 100);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
