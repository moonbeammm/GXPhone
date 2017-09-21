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
    
    NSDictionary *fontAttr = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGFloat width = [@"sdfsdfsdf搜地方了就是的父类搜地方老师的减肥了时间到了番剧是里点击飞洛杉矶的 老师的积分了删了可的番剧乐山大佛老师的积分老师的积分老师的积分数量的附件历史地看番剧" sizeWithAttributes:fontAttr].width;
    width = width + 10;
    
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
