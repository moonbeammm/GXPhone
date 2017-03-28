//
//  GXContainerView.h
//  GXProject_1
//
//  Created by sunguangxin on 16/8/9.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GXContainerTopBar.h"

@interface GXContainerView : UIView

// contentControllers的view
@property (nonatomic, strong) NSArray *contentViews;

@property (nonatomic, readonly) UIScrollView *scrollView;
@property (nonatomic, readonly) GXContainerTopBar *topBar;
@property (nonatomic, assign) CGFloat topBarHeight;

// 设置后不会layoutSubviews，需要手动调用.
@property (nonatomic, strong) NSArray *contentControllers;

// parentController可以为nil，但子VC就没法收到appear和disappear等事件.
- (instancetype)initWithController:(UIViewController *)parentController;

@end
