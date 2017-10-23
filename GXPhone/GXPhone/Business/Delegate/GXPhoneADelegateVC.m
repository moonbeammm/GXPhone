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
    [self addSubviews];

    [self leaks1];
    [self leaks2];
    [self leaks3];
    
    [self timeProfiler];
    
}

- (void)timeProfiler
{
    for (NSInteger i = 0; i < 1000; i++) {
        NSLog(@"TimeProfiler!");
    }
}

- (void)leaks1
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorRef = CGColorCreate(colorSpace, (CGFloat[]){1, 0, 0, 0.8});
    UIColor *color = [UIColor colorWithCGColor:colorRef];
    self.view.backgroundColor = color;
}

- (void)leaks2
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorRef = CGColorCreate(colorSpace, (CGFloat[]){1, 0, 0, 0.8});
    UIColor *color = [UIColor colorWithCGColor:colorRef];
    self.view.backgroundColor = color;
}

- (void)leaks3
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorRef = CGColorCreate(colorSpace, (CGFloat[]){1, 0, 0, 0.8});
    UIColor *color = [UIColor colorWithCGColor:colorRef];
    self.view.backgroundColor = color;
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
