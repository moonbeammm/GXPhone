//
//  GXPhoneCategoryVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneCategoryVC.h"
#import "GXPhoneCategoryVM.h"
#import "GXPhoneBaseTableViewCell.h"
#import "GXPhoneNavigator.h"

@interface GXPhoneCategoryVC ()

@property (nonatomic, strong) UIView *naviView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) GXPhoneCategoryVM *viewModel;
@property (nonatomic, strong) NSArray *model;

@end

@implementation GXPhoneCategoryVC


- (instancetype)init
{
    if (self = [super init]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.tabBarItem.image = [UIImage imageNamed:@"home_category_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_category_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        self.viewModel = [[GXPhoneCategoryVM alloc] init];
//        [self.viewModel loadData];
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
    GXPhoneBaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXPhoneBaseTableViewCell class]) forIndexPath:indexPath];
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
    
//    [self.naviView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self.view);
//        make.height.equalTo(@(64));
//    }];
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.naviView);
//        make.centerY.equalTo(self.naviView).offset(10);
//        make.height.equalTo(@34);
//    }];
    self.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
}

- (void)registerCell
{
    [self.tableView registerClass:[GXPhoneBaseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([GXPhoneBaseTableViewCell class])];
}

- (UIView *)naviView
{
    if (_naviView == nil) {
        _naviView = [[UIView alloc] init];
        _naviView.backgroundColor = [UIColor yellowColor];
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
