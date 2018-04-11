//
//  GXPhoneTwoScrollVC+Two.m
//  GXPhone
//
//  Created by sgx on 2018/3/3.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneTwoScrollVC+Two.h"

@implementation GXPhoneTwoScrollVC (Two)

+ (void)load {
    [super load];
    NSLog(@"我是分类two>> 重写了+load方法.%@",self);
}

+ (void)initialize {
    [super initialize];
    NSLog(@"sgx 我是分类two.重写了initilize方法%@",self);
}

@end
