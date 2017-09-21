//
//  GXPhoneADelegateVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/6/5.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneADelegateVC.h"
#import "GXPhoneBDelegateVC.h"

@interface GXPhoneADelegateVC ()

@property (nonatomic, strong) GXPhoneBDelegateVC *vc;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation GXPhoneADelegateVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"delegateVC";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubviews];
}

- (void)addSubviews
{
    [self addChildViewController:self.vc];
    [self.view addSubview:self.vc.view];
    [self.vc didMoveToParentViewController:self];
    [self.view addSubview:self.btn];
    [self.vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(300));
    }];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.equalTo(self.view);
        make.width.height.equalTo(@(100));
    }];
}

- (void)click
{
    [self.vc delegateTest];
}

- (GXPhoneBDelegateVC *)vc
{
    if (_vc == nil) {
        _vc = [[GXPhoneBDelegateVC alloc] init];
    }
    return _vc;
}

- (UIButton *)btn
{
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        [_btn setTitle:@"按钮" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor redColor];
        [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

@end
