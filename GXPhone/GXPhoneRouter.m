//
//  GXPhoneRouter.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneRouter.h"
#import "GXPhoneProtectVC.h"

@implementation GXPhoneRouter

+ (void)initialize
{
    [[GXRouter shared] map:@"main/business/protectvc" toControllerClass:[GXPhoneProtectVC class]];
}

@end
