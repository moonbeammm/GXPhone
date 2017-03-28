//
//  GXPhoneNavigator.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneNavigator.h"

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

@end
