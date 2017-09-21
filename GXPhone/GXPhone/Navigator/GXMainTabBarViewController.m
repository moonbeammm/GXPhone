//
//  GXMainTabBarViewController.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXMainTabBarViewController.h"
#import "GXPhoneCategoryVC.h"
#import "GXPhoneSearchVC.h"
#import "GXPhoneUserVC.h"
#import "GXPhoneBus.h"

@interface GXMainTabBarViewController ()

@end

@implementation GXMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];

    self.view.backgroundColor = [UIColor whiteColor];
    [self configureChildVC];
}

- (void)configureChildVC
{
    NSArray * vcs = @[
                      [self getHomeLibraryVC],
                      [[GXPhoneCategoryVC alloc] init],
                      [[GXPhoneSearchVC alloc] init],
                      [[GXPhoneUserVC alloc] init]
                      ];
    [self setViewControllers:vcs animated:YES];
}

- (UIViewController *)getHomeLibraryVC
{
    // validator为了让bus验证这个url的对应的busModel里有没有对应的类型的值.
    // 如果没有就返回nil;
    GXBusValidator *validator = [GXBusValidator new];
    [validator setControllerValidationForKey:@"vc"];
    
    // 传过去的参数
    GXBusModel *paraModel = [GXBusModel new];
    // 测试传递viewModel
    // NSObject *viewModel = [[NSObject alloc] init];
    // [paraModel setViewModelValue:viewModel forKey:@"viewModel"];
    [paraModel setStringValue:@"GXPhone-GXMainTabBarViewController" forKey:@"from"];
    
    // 通过url获取busModel
    // busModel里保存了一开始设置好的你想要的值(如vc)
    GXBusModel *busModel = [GXBusMagiSystem callFunction:@"home/home_vc" withModel:paraModel validator:validator];
    if (!busModel) {
        return [[UIViewController alloc] init];
    }
    
    // 通过busModel获取你想要的值
    UIViewController * vc = [busModel controllerValueForKey:@"vc"];
    return vc ? : [[UIViewController alloc] init];
}

@end
