//
//  GXPhoneBDelegateVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/6/5.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneBDelegateVC.h"

@interface GXPhoneBDelegateVC ()

@end

@implementation GXPhoneBDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)delegateTest
{
    NSLog(@"调用delegateTestVC遵守的代理方法!");
}

@end
