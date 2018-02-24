//
//  GXPhoneTwoScrollVC.h
//  GXPhone
//
//  Created by sgx on 2018/2/24.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

/**
 
 测试scrollview A包含了另一个scrollview B
 A/B的滑动手势冲突的问题.
 
 这样的话可以自定义一个scrollView.(如GXPhoneTwoScrollView)
 然后遵守UIGestureRecognizerDelegate.
 覆写shouldRecognizeSimultaneouslyWithGestureRecognizer
 返回YES.
 这样就可以是两个scrollView同时响应手势
 
 */

#import <UIKit/UIKit.h>

@interface GXPhoneTwoScrollVC : UIViewController

@end
