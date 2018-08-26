//
//  GXPhoneTouchEventButton.m
//  GXPhone
//
//  Created by sgx on 2018/5/3.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneTouchEventButton.h"

@implementation GXPhoneTouchEventButton

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    NSLog(@"传递链 >> btn");
//    return self;//[super hitTest:point withEvent:event];
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"响应链 >> btn");
    [super touchesBegan:touches withEvent:event];
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return self;
//}

//- (void)touchBtn
//{
//    NSLog(@"btn touchupinside");
//}

@end
