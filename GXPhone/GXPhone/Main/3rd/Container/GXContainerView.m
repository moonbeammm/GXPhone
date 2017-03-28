//
//  GXContainerView.m
//  GXProject_1
//
//  Created by sunguangxin on 16/8/9.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "GXContainerView.h"
#import "UIView+Frame.h"

@interface GXContainerView () <UIScrollViewDelegate, GXContainerTopBarDelegate>
{
    __weak UIViewController *_parentController;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) GXContainerTopBar *topBar;

@end

@implementation GXContainerView

- (instancetype)initWithController:(UIViewController *)parentController
{
    if (self = [super init]) {
        self.topBarHeight = 64;
        [self addSubview:self.scrollView];
        [self addSubview:self.topBar];
        _parentController = parentController;
        self.scrollView.backgroundColor = [UIColor yellowColor];
        
    }
    return self;
}

- (void)setContentControllers:(NSArray *)contentControllers
{
    NSMutableArray *views = [NSMutableArray array];
    NSMutableArray *titles = [NSMutableArray array];
    for (UIViewController *contentController in contentControllers) {
        if (!contentController) {
            return;
        }
        [views addObject:contentController.view];
        [titles addObject:contentController.title ?: @"??"];
    }
    
    // 这里的superView为containerView的父视图.即parentVC的view.
    if (_parentController && self.superview) {
        for (UIViewController *contentController in _contentControllers) {
            [contentController willMoveToParentViewController:nil];
        }
        for (UIViewController *contentController in contentControllers) {
            [_parentController addChildViewController:contentController];
        }
    }
    self.contentViews = views;
    if (_parentController && self.superview) {
        for (UIViewController *contentController in _contentControllers) {
            [contentController removeFromParentViewController];
        }
        for (UIViewController *contentController in contentControllers) {
            [contentController didMoveToParentViewController:_parentController];
        }
    }
    self.topBar.titles = titles;
    
    _contentControllers = contentControllers;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat viewWidth = CGRectGetWidth(self.bounds);
    self.topBar.frame = CGRectMake(0, 0, viewWidth, self.topBarHeight);
    CGFloat scrollViewHeight = CGRectGetHeight(self.bounds) - self.topBarHeight - kGXPHONE_TAB_BAR_HEIGHT;
    self.scrollView.frame = CGRectMake(0, self.topBarHeight, viewWidth, scrollViewHeight);

    
    CGFloat contentSizeW = viewWidth * _contentViews.count;
    CGFloat contentSizeH = scrollViewHeight;
    self.scrollView.contentSize = CGSizeMake(contentSizeW, contentSizeH);
    
    CGFloat contentOffsetX = self.topBar.selectedIndex * viewWidth;
    self.scrollView.contentOffset = CGPointMake(contentOffsetX, 0);
    
    for (NSUInteger i = 0; i < _contentViews.count; i++) {
        UIView * contentView = _contentViews[i];
        contentView.frame = CGRectMake(viewWidth * i, 0, viewWidth, scrollViewHeight);
    }
}

- (void)setContentViews:(NSArray *)contentViews
{
    // 防空处理
    for (UIView * contentView in contentViews) {
        if (!contentView) {
            return;
        }
    }
    
    // 把原来保存的views删除.
    for (UIView * contentView in _contentViews) {
        [contentView removeFromSuperview];
    }
    
    // 设置新的.
    for (UIView * contentView in contentViews) {
        [self.scrollView addSubview:contentView];
    }
    _contentViews = contentViews;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.topBar updateIndicator:scrollView.contentOffset.x / scrollView.contentSize.width];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.topBar.selectedIndex = (NSUInteger)(scrollView.contentOffset.x / CGRectGetWidth(scrollView.bounds));
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self scrollViewDidEndDecelerating:scrollView];
    }
}

#pragma mark - topBarDelegate
- (void)didChangeSelectIndex:(NSUInteger)selectedIndex animated:(BOOL)animated
{
    if (animated) {
        self.userInteractionEnabled = NO;
        __weak typeof(self) weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(self) strongSelf = weakSelf;
            strongSelf.userInteractionEnabled = YES;
        });
    }
    
    CGPoint scrollViewContentOffset = CGPointMake(selectedIndex * CGRectGetWidth(self.scrollView.bounds), 0);
    [self.scrollView setContentOffset:scrollViewContentOffset animated:animated];
}

#pragma mark - lazy load
- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
//        _scrollView.showsVerticalScrollIndicator = NO;
//        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        _scrollView.scrollsToTop = NO; // 点击状态栏是否滚到顶部.
        _scrollView.directionalLockEnabled = YES;
    }
    return _scrollView;
}

- (GXContainerTopBar *)topBar
{
    if (_topBar == nil) {
        _topBar = [[GXContainerTopBar alloc] init];
        _topBar.delegate = self;
    }
    return _topBar;
}

@end
