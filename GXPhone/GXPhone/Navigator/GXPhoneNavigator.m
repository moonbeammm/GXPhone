//
//  GXPhoneNavigator.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneNavigator.h"
#import "GXPhoneADelegateVC.h"
#import "GXPhoneRebaseTestVC.h"
#import "GXPikerViewVC.h"
#import "GXPhoneProtectVC.h"
#import "GXPhoneDelayPerformMethodVC.h"

@implementation GXPhoneNavigator

+ (GXPhoneNavigator *)shared
{
    static dispatch_once_t onceToken;
    static GXPhoneNavigator * shared = nil;
    dispatch_once(&onceToken, ^{
        shared = [[GXPhoneNavigator alloc] init];
    });
    return shared;
}

- (void)showCAAnimationVC
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showDelegateVC
{
    GXPhoneADelegateVC *vc = [[GXPhoneADelegateVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showRebaseTestVC
{
    GXPhoneRebaseTestVC *vc = [[GXPhoneRebaseTestVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showPickerViewVC
{
    GXPikerViewVC *vc = [[GXPikerViewVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showProtectVC
{
    GXPhoneProtectVC *vc = [[GXPhoneProtectVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showDelayPerformMethodVC
{
    GXPhoneDelayPerformMethodVC *vc = [[GXPhoneDelayPerformMethodVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
