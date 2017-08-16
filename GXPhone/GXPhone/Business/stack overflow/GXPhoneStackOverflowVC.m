//
//  GXPhoneStackOverflowVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/17.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneStackOverflowVC.h"

@implementation GXPhoneStackOverflowVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"栈溢出";
    }
    return self;
}

- (void)viewDidLoad
{
    [self methodOne:^(NSString *name) {
//        NSLog(@"name:%@",name);
    }];
}

- (void)methodOne:(void(^)(NSString *))block
{
    [self methodTwo:block];
}

- (void)methodTwo:(void(^)())block
{
    [self methodFour:^{
        //    [self uselessMethod:100];
        if (block) {
            block();
        }
    }];

}

- (void)methodFour:(void(^)())block
{
    if (block) {
        block();
    }
}

- (void)uselessMethod:(NSInteger)age
{
    NSLog(@"age:%zd",age);
}

@end
