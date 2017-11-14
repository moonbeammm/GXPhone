//
//  GXPhoneLabelTestVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneLabelTestVC.h"

@interface GXPhoneLabelTestVC ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation GXPhoneLabelTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
    [self testNumberOfLines];
}

- (void)testNumberOfLines
{
    self.textLabel.backgroundColor = [UIColor blueColor];
    self.textLabel.text = @"hahah\n大声的告诉我.我换行了吗?\n大声的告诉我.我换行了吗?\n大声的告诉我.我换行了吗?";
}

#pragma mark - Public Method

#pragma mark - Private Method

#pragma mark - Event Response

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.view addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(50));
        make.right.equalTo(@(-50));
        make.height.equalTo(@(200));
        make.bottom.equalTo(self.view);
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
    }
    return _textLabel;
}

@end
