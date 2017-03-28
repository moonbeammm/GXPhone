//
//  GXContainerTopBar.h
//  GXProject_1
//
//  Created by sunguangxin on 16/8/9.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GXContainerTopBarDelegate <NSObject>

- (void)didChangeSelectIndex:(NSUInteger)selectedIndex animated:(BOOL)animated;

@end

@interface GXContainerTopBar : UIView

// 自定义设置
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemPadding;
@property (nonatomic, assign) CGFloat leftPadding;
@property (nonatomic, assign) CGFloat rightPadding;
@property (nonatomic, assign) CGFloat topPadding;

// 当前选中的index
@property (nonatomic, assign) NSUInteger selectedIndex;
@property (nonatomic, assign) NSUInteger currentIndex;

// 设置后不会layoutSubviews,需要手动调用
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, readonly) NSArray *items;

@property (nonatomic, readonly) UIScrollView *scrollView;
@property (nonatomic, readonly) UIView *selectionIndicator;
@property (nonatomic, readonly) UIView *bottomLine;



@property (nonatomic, weak) id<GXContainerTopBarDelegate> delegate;

- (void)setSelectedIndex:(NSUInteger)selectedIndex animated:(BOOL)animated;
- (void)updateIndicator:(CGFloat)progress;

@end
