//
//  GXPhoneCategoryVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneCategoryVC.h"

@interface GXPhoneCategoryVC ()

@property (nonatomic, strong) UIView *naviView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation GXPhoneCategoryVC


- (instancetype)init
{
    if (self = [super init]) {
        self.view.backgroundColor = GXWhiteColor;
        self.tabBarItem.image = [UIImage imageNamed:@"home_category_tab"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"home_category_tab_s"];
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        self.navigationItem.title = @"分区";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureSubviews];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GXPhoneBaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GXPhoneBaseTableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = @"更多功能,敬请期待!";
    if (indexPath.row == 0) {
        cell.textLabel.text = @"CAAnimation";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [[GXPhoneNavigator shared] showCAAnimationVC];
    }
}

- (void)configureSubviews
{
    [self.tableView registerClass:[GXPhoneBaseTableViewCell class] forCellReuseIdentifier:NSStringFromClass([GXPhoneBaseTableViewCell class])];
//    self.tableView.contentInset = UIEdgeInsetsMake(44, 0, kGXPHONE_TAB_BAR_HEIGHT, 0);
    
//    [self.view addSubview:self.naviView];
//    [self.naviView addSubview:self.titleLabel];
//    
//    [self.naviView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.trailing.equalTo(@(0));
//        make.height.equalTo(@(64));
//    }];
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.naviView);
//        make.bottom.equalTo(self.naviView);
//        make.height.equalTo(@(34));
//    }];
}

- (UIView *)naviView
{
    if (_naviView == nil) {
        _naviView = [[UIView alloc] init];
        _naviView.backgroundColor = GXPinkColor;
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

@end
