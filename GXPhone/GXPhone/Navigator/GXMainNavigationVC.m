//
//  GXMainNavigationVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXMainNavigationVC.h"
#import <GXRuler/GXColors.h>
#import <GXRuler/UIImage+Tint.h>

@interface GXMainNavigationVC () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, readwrite) UIPanGestureRecognizer *dragbackGesture;

@end

@implementation GXMainNavigationVC

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        self.navigationBar.translucent = NO;
        self.delegate = self;
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setShadowImage:[UIImage new]]; // 底部的线的颜色
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17 weight:UIFontWeightRegular]}];
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:GX_PINK_COLOR] forBarMetrics:UIBarMetricsDefault];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    [self customNavigationBarWithController:viewController];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.view.userInteractionEnabled = YES;
    self.interactivePopGestureRecognizer.enabled = self.viewControllers.count > 1;
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - Private Method

/**自定义导航栏*/
- (void)customNavigationBarWithController:(UIViewController *)viewController
{
    if (self.viewControllers.count > 1) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"common_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backPressed)];
    }
}

- (void)backPressed
{
    [self popViewControllerAnimated:YES];
}

@end
