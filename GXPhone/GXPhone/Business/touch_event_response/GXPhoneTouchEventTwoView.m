//
//  GXPhoneTouchEventTwoView.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/22.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneTouchEventTwoView.h"

@implementation GXPhoneTouchEventTwoView

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    NSLog(@"传递链 >> twoView");
//    return self;//[super hitTest:point withEvent:event];
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"响应链 >> twoView");
    [super touchesBegan:touches withEvent:event];
}


@end
