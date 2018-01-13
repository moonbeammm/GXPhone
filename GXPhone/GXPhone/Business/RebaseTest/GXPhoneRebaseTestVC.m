//
//  GXPhoneRebaseTestVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/6/29.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneRebaseTestVC.h"

@interface GXPhoneRebaseTestVC ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation GXPhoneRebaseTestVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"RebaseTest";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
    NSLog(@"rebase test one");
    NSLog(@"rebase test two");
    
    
    
}

#pragma mark - Public Method

#pragma mark - Private Method

#pragma mark - Event Response

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.view addSubview:self.btn];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@(50));
    }];
}

- (UIButton *)btn
{
    if (_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor redColor];
        [_btn setTitle:@"rebaseTest" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _btn;
}

- (void)resetTest
{
    
}

@end
