//
//  GXMainNavigationVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXMainNavigationVC.h"

@interface GXMainNavigationVC () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, readwrite) UIPanGestureRecognizer *dragbackGesture;

@end

@implementation GXMainNavigationVC

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if ([super initWithRootViewController:rootViewController]) {
        
        [self setViewControllers:@[rootViewController]];
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self.navigationBar setBarTintColor:GXPinkColor];8
//        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setTintColor:[UIColor redColor]]; // 设置返回按钮的tintColor
        [self.navigationBar setTranslucent:NO];
        self.delegate = self;
        
        UIBarButtonItem *item = [UIBarButtonItem appearance];
        NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
        textAttrs[NSForegroundColorAttributeName] = HEXCOLOR(0x23aee6);
        textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
        [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
        
        
        NSMutableDictionary *titleText = [NSMutableDictionary dictionary];
        titleText[NSFontAttributeName] = textAttrs[NSFontAttributeName];
        titleText[NSForegroundColorAttributeName] = [UIColor whiteColor];
        
        
        UINavigationBar *bar = [UINavigationBar appearance];
        
        
        [bar setTranslucent:YES];
        [bar setTitleTextAttributes:titleText];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = GXWhiteColor;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    [self customNavigationBarWithController:viewController];
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.view.userInteractionEnabled = YES;
    NSUInteger vcCounts = self.viewControllers.count;
    self.interactivePopGestureRecognizer.enabled = vcCounts > 1;
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - Private Method

/**自定义导航栏*/
- (void)customNavigationBarWithController:(UIViewController *)viewController
{
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"common_back"] imageWithTintColor:[UIColor whiteColor]]
                                                                                       style:UIBarButtonItemStylePlain
                                                                                      target:self
                                                                                      action:@selector(backPressed)];
    }

}

- (void)backPressed
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - LazyLoad




@end
