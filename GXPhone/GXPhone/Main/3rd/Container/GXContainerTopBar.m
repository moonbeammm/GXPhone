//
//  GXContainerTopBar.m
//  GXProject_1
//
//  Created by sunguangxin on 16/8/9.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "GXContainerTopBar.h"
#import "UIView+Frame.h"

#define kTitleNormalColor [UIColor whiteColor]
#define kTitleSelectColor [UIColor whiteColor]
#define kIndicatorColor [UIColor whiteColor]
#define kBottomLineColor [UIColor redColor]
#define kBackgroundColor [UIColor colorWithRed:251./255 green:114./255 blue:153./255 alpha:1]

#define kTitleClickScale 1.0

@interface GXContainerTopBar()

@property (nonatomic, strong) UIView *selectionIndicator;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) NSMutableArray *itemButtons;

@end

@implementation GXContainerTopBar

- (instancetype)init
{
    if (self = [super init]) {
        _titleFont = [UIFont systemFontOfSize:16];
        _topPadding = 20;
        _itemPadding = 28;
        _itemButtons = [NSMutableArray array];
        
        [self addSubview:self.scrollView];
        [self addSubview:self.bottomLine];
        [self.scrollView addSubview:self.selectionIndicator];
        self.backgroundColor = kBackgroundColor;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat barWidth = self.gx_width;
    CGFloat barHeight = self.gx_height;
    CGFloat scrollViewWidth = barWidth - _leftPadding - _rightPadding;
    CGFloat scrollViewHeight = barHeight - _topPadding;
    
    CGSize size = CGSizeMake(scrollViewWidth, scrollViewHeight);
    [self layoutItems:size];
    
    // scrollView的contentSize的width是外界给的itemView * itemButtons.count
    // scrollView的frame.width是self.width - padding.

    if (self.scrollView.contentSize.width < scrollViewWidth) {
        CGPoint center = self.scrollView.center;
        self.scrollView.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, scrollViewHeight);
        self.scrollView.center = center;
    } else if (self.scrollView.contentSize.width == scrollViewWidth) {
        self.scrollView.scrollEnabled = NO;
    } else {
        self.scrollView.scrollEnabled = YES;
    }
    
    self.scrollView.contentOffset = CGPointZero;
    
    CGFloat lineWidth = 1.0 / [UIScreen mainScreen].scale;
    CGFloat bottomLineX = 0;
    CGFloat bottomLineY = barHeight - lineWidth;
    CGFloat bottomLineW = barWidth;
    CGFloat bottomLineH = lineWidth;
    self.bottomLine.frame = CGRectMake(bottomLineX, bottomLineY, bottomLineW, bottomLineH);
}

- (void)layoutItems:(CGSize)size
{

    CGFloat scrollViewX = self.leftPadding;
    CGFloat scrollViewY = self.topPadding;
    CGFloat scrollViewW = size.width;
    CGFloat scrollViewH = size.height;
    self.scrollView.frame = CGRectMake(scrollViewX, scrollViewY, scrollViewW, scrollViewH);
    
    CGFloat titleAdjustWidth = self.itemWidth;
    if (self.itemWidth == 0) {
        NSDictionary * fontAttr = @{NSFontAttributeName : self.titleFont};
        for (NSString *title in _titles) {
            titleAdjustWidth = [title sizeWithAttributes:fontAttr].width + self.itemPadding;
            self.itemWidth = MAX(titleAdjustWidth, self.itemWidth);
        }
    }
    
    CGFloat scrollViewContentSizeW = self.itemWidth * _itemButtons.count;
    CGFloat scrollViewContentSizeH = size.height;
    self.scrollView.contentSize = CGSizeMake(scrollViewContentSizeW, scrollViewContentSizeH);
    
    UIButton * btn = nil;
    for (NSUInteger i = 0; i < _itemButtons.count; i++) {
        btn = (UIButton *)_itemButtons[i];
        btn.frame = CGRectMake(self.itemWidth * i, 0, self.itemWidth, size.height);
    }
    self.selectionIndicator.frame = CGRectMake(titleAdjustWidth * _selectedIndex, size.height - 3, titleAdjustWidth, 3);
}

- (void)setTitles:(NSArray *)titles
{
    for (NSString *title in titles) {
        if (!title) {
            return;
        }
    }
    
    for (UIButton *btn in _itemButtons) {
        btn.hidden = YES;
    }
    
    
    for (NSUInteger i = 0; i < titles.count; i++) {
        UIButton * btn = nil;
        
        // itemButtons默认为空.
        if (i < _itemButtons.count) {
            btn = (UIButton *)_itemButtons[i];
            btn.hidden = NO;
        } else {
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitleColor:kTitleNormalColor forState:UIControlStateNormal];
            btn.titleLabel.font = self.titleFont;
            btn.tag = i;
            [btn addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:btn];
            [_itemButtons addObject:btn];
        }
        
        if (i == _selectedIndex) {
            [btn setTitleColor:kTitleSelectColor forState:UIControlStateNormal];
            btn.transform = CGAffineTransformMakeScale(kTitleClickScale, kTitleClickScale);
        } else {
            [btn setTitleColor:kTitleNormalColor forState:UIControlStateNormal];
            btn.transform = CGAffineTransformIdentity;
        }
        
        [btn setTitle:titles[i] forState:UIControlStateNormal];
    }
    
    [self.scrollView bringSubviewToFront:self.selectionIndicator];
    _titles = titles;
    
    
}

- (void)selectAction:(UIButton *)btn
{
    [self setSelectedIndex:btn.tag animated:YES];
}

// 属性的set方法
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [self setSelectedIndex:selectedIndex animated:NO];
}

#pragma mark - public
- (void)setSelectedIndex:(NSUInteger)selectedIndex animated:(BOOL)animated
{
    if (selectedIndex < _itemButtons.count && selectedIndex != _selectedIndex) {
        // 恢复上次点击的btn状态
        UIButton * lastBtn = (UIButton *)_itemButtons[_selectedIndex];
        [lastBtn setTitleColor:kTitleNormalColor forState:UIControlStateNormal];
        lastBtn.transform = CGAffineTransformMakeScale(1, 1);
        
        // 设置现在点击的btn为高亮
        UIButton * selBtn = (UIButton *)_itemButtons[selectedIndex];
        [selBtn setTitleColor:kTitleSelectColor forState:UIControlStateNormal];
        
        // 放大被点击的button
        selBtn.transform = CGAffineTransformMakeScale(kTitleClickScale, kTitleClickScale);
        
        // 触发selectedIndex的KVO
        [self willChangeValueForKey:@"selectedIndex"];
        _selectedIndex = selectedIndex;
        [self didChangeValueForKey:@"selectedIndex"];
        
        if (self.delegate) {
            [self.delegate didChangeSelectIndex:selectedIndex animated:animated];
        }
    }
    
}


- (void)updateIndicator:(CGFloat)progress
{
    if (progress != progress) {
        // Check NaN
        return;
    }
    if (self.scrollView.contentSize.width == 0 || _itemWidth == 0) {
        // Avoid NaN
        return;
    }
    CGRect frame = self.selectionIndicator.frame;
    frame.origin.x = self.scrollView.contentSize.width * progress;
    self.selectionIndicator.frame = frame;
    
    if (self.scrollView.scrollEnabled) {
        NSUInteger itemCount = [_itemButtons count];
        CGFloat offsetProgress = progress * itemCount / (itemCount - 1);
        CGPoint newOffset = CGPointMake((self.scrollView.contentSize.width - CGRectGetWidth(self.scrollView.bounds)) * offsetProgress, 0);
        [self.scrollView setContentOffset:newOffset];
    }
    
    for (UIButton *button in _itemButtons) {
        [button setTitleColor:kTitleNormalColor forState:UIControlStateNormal];
        button.transform = CGAffineTransformMakeScale(1, 1);
    }
}


#pragma mark - lazy load

- (UIView *)selectionIndicator
{
    if (_selectionIndicator == nil) {
        _selectionIndicator = [[UIView alloc] init];
        _selectionIndicator.backgroundColor = kIndicatorColor;
    }
    return _selectionIndicator;
}

- (UIView *)bottomLine
{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = kBottomLineColor;
    }
    return _bottomLine;
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.scrollsToTop = NO;
    }
    return _scrollView;
}



















@end
