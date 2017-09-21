//
//  GXPhoneRACDisposerShare.m
//  GXPhone
//
//  Created by sunguangxin on 2017/9/11.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneRACDisposerShare.h"

@implementation GXPhoneRACDisposerShare

+ (GXPhoneRACDisposerShare *)shared
{
    static dispatch_once_t onceToken;
    static GXPhoneRACDisposerShare * share = nil;
    dispatch_once(&onceToken, ^{
        share = [[GXPhoneRACDisposerShare alloc] init];
        share.name = @"GXPhoneRACDisposerShare____";
    });
    return share;
}

@end
