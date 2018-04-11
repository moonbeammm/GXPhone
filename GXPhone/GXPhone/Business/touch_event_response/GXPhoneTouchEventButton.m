//
//  GXPhoneTouchEventButton.m
//  GXPhone
//
//  Created by sgx on 2018/5/3.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneTouchEventButton.h"

@implementation GXPhoneTouchEventButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"======================%@-%@-传递链",NSStringFromClass([self class]), NSStringFromSelector(@selector(hitTest:withEvent:)));
    return [super hitTest:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"++++++++++++++++++++++%@-%@-响应链",NSStringFromClass([self class]), NSStringFromSelector(@selector(touchesBegan:withEvent:)));
    [super touchesBegan:touches withEvent:event];
}

@end
