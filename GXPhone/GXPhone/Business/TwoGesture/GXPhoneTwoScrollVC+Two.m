//
//  GXPhoneTwoScrollVC+Two.m
//  GXPhone
//
//  Created by sgx on 2018/3/3.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneTwoScrollVC+Two.h"

@implementation GXPhoneTwoScrollVC (Two)


/**
 +load方法不要调用[super load];
 因为如果父类也实现了+load方法.
 那么子类调用[super load];时.父类的load方法又会被执行一遍.
 
 如果父类有分类.并且也实现了load方法的话.
 子类调用[super load];方法时会调用父类的分类的load方法.而不会调用父类的load方法.
 */
+ (void)load {
    NSLog(@"[+load]  >>  分类two");
}

+ (void)initialize {
    NSLog(@"[+initilize]  >>  分类two 😁😁😁是不是奇怪我为什么被调用了.因为子类的load方法调用了super");
}

@end

