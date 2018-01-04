//
//  GXPhoneAppDelegate.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/10.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneAppDelegate.h"

// 基类
#import "GXMainTabBarViewController.h"
#import "GXMainNavigationVC.h"

// 设置naviVC
#import "GXPhoneNavigator.h"
#import "GXPhoneRouter.h"

// 三方库
#import <DCIntrospect-ARC/DCIntrospect.h>
#import <YYFPSLabel/YYFPSLabel.h>

// 首页动态化数据
#import "GXPhoneFeedCardJson.h"

#define kDocumentDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

@implementation GXPhoneAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"第一次启动!");
    [GXPhoneFeedCardJson getHomeFeedCardJson];
    [self configureRooterVC];
    [self configureNavigator];
    [self configureStatusBarStyle:application];
    [self configureDCIntrospect];
    [self configureYYFPSLabel];
    return YES;
}

- (void)configureLaunchScreen
{
    [self configureRooterVC];
    BOOL isFirstLogined = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstLogined"] boolValue];
    if (!isFirstLogined) {// 第一次启动
        [self configureStartMovie];
    }
}

- (void)configureStartMovie
{
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isFirstLogin"];
    NSURL * url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"startMovie" ofType:@"mp4"]];
    NSLog(@"startMovie Url: %@",url);
    UIViewController * startMovieVC = [[UIViewController alloc] init];
    [self.window addSubview:startMovieVC.view];
    [self.window bringSubviewToFront:startMovieVC.view];
    
}

- (void)configureRooterVC
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    GXMainTabBarViewController * tabBarVC = [[GXMainTabBarViewController alloc] init];
    self.naviVC = [[GXMainNavigationVC alloc] initWithRootViewController:tabBarVC];
    self.window.rootViewController = self.naviVC;
    [self.window makeKeyAndVisible];
}

- (void)configureNavigator
{
    [GXPhoneNavigator shared].navigationController = self.naviVC;
    [GXPhoneRouter setNavigationController:self.naviVC];
}

- (void)configureStatusBarStyle:(UIApplication *)application
{
    application.statusBarStyle = UIStatusBarStyleLightContent;
}








/// 三方库接入

- (void)configureDCIntrospect
{
    // always call after makeKeyAndDisplay.
    // 界面调试工具.
#if TARGET_IPHONE_SIMULATOR
    [[DCIntrospect sharedIntrospector] start];
#endif
}

- (void)configureYYFPSLabel
{
#if DEBUG
    YYFPSLabel *label = [[YYFPSLabel alloc] init];
    CGSize size = self.window.frame.size;
    label.frame = CGRectMake(size.width - 40, size.height-15, 40, 15);
    label.font = [UIFont systemFontOfSize:10];
    label.userInteractionEnabled = YES;
    [self.window.rootViewController.view addSubview:label];
#endif
}















- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"进入不活跃状态");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"将进入后台\n沙盒路径: %@",kDocumentDirectory);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"将进入前台");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"进入活跃状态");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"程序将终止");
}

@end
