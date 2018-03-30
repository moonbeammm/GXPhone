//
//  GXPhoneLabelTestVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneLabelTestVC.h"

@interface GXPhoneLabelTestVC ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation GXPhoneLabelTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
    [self testNumberOfLines];
    self.topView.hidden = YES;
}

- (void)testNumberOfLines
{
    self.textLabel.text = @"hahah\n大声的告诉我.我换行了吗?\n大声的告诉我.我换行了吗?\n大声的告诉我.我换行了吗?";
}

#pragma mark - Public Method

#pragma mark - Private Method

#pragma mark - Event Response

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.topView];
    [self.bgView addSubview:self.textLabel];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(50));
        make.top.equalTo(@(100));
        make.right.equalTo(@(-50));
    }];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.bgView);
        make.height.equalTo(@(100));
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom);
        make.left.equalTo(@(50));
        make.right.equalTo(@(-50));
        make.height.equalTo(@(200));
        make.bottom.equalTo(self.bgView.mas_bottom);
    }];
}

- (UILabel *)textLabel
{
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:13];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.backgroundColor = [UIColor grayColor];
        _textLabel.numberOfLines = 0;
        _textLabel.layer.borderColor = [UIColor blueColor].CGColor;
        _textLabel.layer.borderWidth = 1;
    }
    return _textLabel;
}

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor redColor];
    }
    return _bgView;
}

- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor greenColor];
    }
    return _topView;
}

@end
