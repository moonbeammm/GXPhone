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
+ (NSArray *)insertSortWithArray:(NSArray *)arry {
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:arry];
    for (int i = 1; i < arry.count; i++) {
        for (int j = i; j > 0; j--) {
            if ([mutArr[j] intValue] < [mutArr[j-1] intValue]) {
                [mutArr exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            } else {
                break;
            }
        }
    }
    return [mutArr copy];
}

///数组去重.
/// NSDictionary也可以达到NSSet效果
+ (NSArray *)removeRepeatWithArray:(NSArray *)array {
    NSSet *set = [NSSet setWithArray:array];
    NSArray *resultArr = [NSArray arrayWithArray:set.allObjects];
    return [resultArr mutableCopy];
}

@end
