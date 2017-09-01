//
//  GXPhoneTouchEventOneView.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/22.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneTouchEventOneView.h"

@implementation GXPhoneTouchEventOneView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"====%@-%@-传递链",NSStringFromClass([self class]), NSStringFromSelector(@selector(hitTest:withEvent:)));
    return [super hitTest:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"++++%@-%@-响应链",NSStringFromClass([self class]), NSStringFromSelector(@selector(touchesBegan:withEvent:)));
    [super touchesBegan:touches withEvent:event];
}

@end