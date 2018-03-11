//
//  GXPhoneArithmeticHelper.m
//  GXPhone
//
//  Created by sgx on 2018/3/7.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneArithmeticHelper.h"

@implementation GXPhoneArithmeticHelper

/// 插入排序
/// @[@(50),@(7),@(1),@(10),@(39),@(8)]
+ (NSArray *)insertSortWithArray:(NSArray *)arry {
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:arry];
    for (int i = 0; i < arry.count - 1; i++) {
        for (int j = i; j >= 0; j--) {
            if ([mutArr[j+1] intValue] < [mutArr[j] intValue]) {
                [mutArr exchangeObjectAtIndex:j+1 withObjectAtIndex:j];
            } else {
                break;
            }
        }
    }
    return [mutArr copy];
}

/// 冒泡排序
/// @[@(50),@(7),@(1),@(10),@(39),@(8)]
+ (NSArray *)bubbleSortWithArray:(NSArray *)arry {
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:arry];
    for (int i = 0; i < arry.count - 1; i++) {
        for (int j = 0; j < arry.count - 1 - i; j++) {
            if ([mutArr[j] intValue] > [mutArr[j+1] intValue]) {
                [mutArr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    return [mutArr copy];
}

/// 选择排序
/// @[@(50),@(7),@(1),@(10),@(39),@(8)]
+ (NSArray *)selectSortWithArray:(NSArray *)arry {
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:arry];
    int miniIndex = 0;
    for (int i = 0; i < arry.count - 1; i++) {
        miniIndex = i;
        for (int j = i+1; j < arry.count; j++) {
            if ([mutArr[j] intValue] < [mutArr[miniIndex] intValue]) {
                miniIndex = j;
            }
        }
        [mutArr exchangeObjectAtIndex:i withObjectAtIndex:miniIndex];
    }
    return [mutArr copy];
}

/// 冒泡优化
/// https://www.jianshu.com/p/d7fc06845a6f

///数组去重.
/// NSDictionary也可以达到NSSet效果
+ (NSArray *)removeRepeatWithArray:(NSArray *)array {
    NSSet *set = [NSSet setWithArray:array];
    NSArray *resultArr = [NSArray arrayWithArray:set.allObjects];
    return [resultArr mutableCopy];
}

@end
