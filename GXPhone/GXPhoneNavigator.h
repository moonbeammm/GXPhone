//
//  GXPhoneNavigator.h
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GXPhoneNavigator : NSObject

+ (GXPhoneNavigator *)shared;

@property(nonatomic,readwrite,weak) UINavigationController *navigationController;

- (void)showCAAnimationVC;
- (void)showDelegateVC;
- (void)showRebaseTestVC;
- (void)showPickerViewVC;
- (void)showProtectVC;
- (void)showDelayPerformMethodVC;
- (void)showStackOverflowVC;
- (void)showTouchEventVC;
- (void)showPageViewVC;
- (void)showLabelTestVC;
- (void)showCountDownVC;

@end
