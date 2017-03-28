//
//  UIView+Frame.m
//  GXProject_1
//
//  Created by sunguangxin on 16/8/9.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setGx_x:(CGFloat)gx_x
{
    CGRect rect = self.frame;
    rect.origin.x = gx_x;
    self.frame = rect;
}

- (CGFloat)gx_x
{
    return self.frame.origin.x;
}

- (void)setGx_y:(CGFloat)gx_y
{
    CGRect rect = self.frame;
    rect.origin.y = gx_y;
    self.frame = rect;
}

- (CGFloat)gx_y
{
    return self.frame.origin.y;
}

- (void)setGx_width:(CGFloat)gx_width
{
    CGRect rect = self.frame;
    rect.size.width = gx_width;
    self.frame = rect;
}

- (CGFloat)gx_width
{
//    return self.frame.size.width;
    return self.bounds.size.width;
}

- (void)setGx_height:(CGFloat)gx_height
{
    CGRect rect = self.frame;
    rect.size.height = gx_height;
    self.frame = rect;
}

- (CGFloat)gx_height
{
//    return self.frame.size.height;
    return self.bounds.size.height;
}

- (void)setGx_centerX:(CGFloat)gx_centerX
{
    CGPoint center = self.center;
    center.x = gx_centerX;
    self.center = center;
}

- (CGFloat)gx_centerX
{
    return self.center.x;
}

- (void)setGx_centerY:(CGFloat)gx_centerY
{
    CGPoint center = self.center;
    center.y = gx_centerY;
    self.center = center;
}

- (CGFloat)gx_centerY
{
    return self.center.y;
}

- (void)setGx_size:(CGSize)gx_size
{
    
    CGRect rect = self.frame;
    rect.size = gx_size;
    self.frame = rect;
}

- (CGSize)gx_size
{
    return self.frame.size;
}

@end
