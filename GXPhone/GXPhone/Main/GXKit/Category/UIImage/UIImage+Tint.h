//
//  UIImage+Tint.h
//  GXPhone
//
//  Created by sunguangxin on 2017/3/8.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

@end
