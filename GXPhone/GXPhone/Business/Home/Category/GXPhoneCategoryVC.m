//
//  GXPhoneCategoryVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneCategoryVC.h"
#import "GXPhoneCategoryVM.h"

#import <GXRuler/GXBaseTableViewCell.h>
#import "GXPhoneNavigator.h"

#import <GXRuler/GXImageManager.h>
#import <GXRuler/UIView+Frame.h>
#import <GXRuler/GXColors.h>

@interface GXPhoneCategoryVC ()

@property (nonatomic, strong) UIView *naviView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) GXPhoneCategoryVM *viewModel;
@property (nonatomic, strong) NSArray *model;

@end

@implementation GXPhoneCategoryVC
@synthesize viewModel;

- (instancetype)init
{
    if (self = [super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.tabBarItem.image = GXImageMake(GXPhone,@"home_category_tab");
        self.tabBarItem.selectedImage = GXImageMake(GXPhone,@"home_category_tab_s");
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        self.viewModel = [[GXPhoneCategoryVM alloc] init];
        [self.viewModel tryLoadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubviews];
    [self registerCell];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GXBaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXBaseTableViewCell class]) forIndexPath:indexPath];
    NSString *title = self.model[indexPath.row][@"title"];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *method = self.model[indexPath.row][@"method"];
    GXPhoneNavigator *navigator = [GXPhoneNavigator shared];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    SEL selector = NSSelectorFromString(method);
    if ([navigator respondsToSelector:selector]) {
        [navigator performSelector:selector];
    }
#pragma clang diagnostic pop
}

- (void)addSubviews
{
    [self.view addSubview:self.naviView];
    [self.naviView addSubview:self.titleLabel];
    self.naviView.frame = CGRectMake(0, 0, self.view.viewWidth, 64);
    self.titleLabel.frame = CGRectMake((self.view.viewWidth - 40) / 2, 30, 40, 34);
    self.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
}

- (void)registerCell
{
    [self.tableView registerClass:[GXBaseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([GXBaseTableViewCell class])];
}

- (UIView *)naviView
{
    if (_naviView == nil) {
        _naviView = [[UIView alloc] init];
        _naviView.backgroundColor = GX_PINK_COLOR;
    }
    return _naviView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"分区";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        
    }
    return _titleLabel;
}

- (NSArray *)model
{
    if (_model == nil) {
        _model = @[
                  @{@"title":@"delegateTestVC",
                    @"method":@"showDelegateVC"},
                  @{@"title":@"rebaseTest",
                    @"method":@"showRebaseTestVC"},
                  @{@"title":@"UIPickerView",
                    @"method":@"showPickerViewVC"},
                  @{@"title":@"showProtectVC!!",
                    @"method":@"showProtectVC"},
                  @{@"title":@"延时执行方法!!",
                    @"method":@"showDelayPerformMethodVC"},
                  @{@"title":@"stackOverflow!!",
                    @"method":@"showStackOverflowVC"},
                  @{@"title":@"showTouchEventVC",
                    @"method":@"showTouchEventVC"},
                  @{@"title":@"顶部菜单栏!!",
                    @"method":@"showPageViewVC"},
                  @{@"title":@"敬请期待!!",
                    @"method":@""},
                  @{@"title":@"敬请期待!!",
                    @"method":@""},
                  @{@"title":@"敬请期待!!",
                    @"method":@""},
                  @{@"title":@"敬请期待!!",
                    @"method":@""},
                  @{@"title":@"敬请期待!!",
                    @"method":@""},
                  @{@"title":@"敬请期待!!",
                    @"method":@""},
                  @{@"title":@"敬请期待!!",
                    @"method":@""}];
    }
    return _model;
}

@end
