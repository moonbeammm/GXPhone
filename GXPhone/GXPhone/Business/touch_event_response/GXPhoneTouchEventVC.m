//
//  GXPhoneTouchEventVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/22.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneTouchEventVC.h"
#import "GXPhoneTouchEventOneView.h"
#import "GXPhoneTouchEventTwoView.h"
#import "GXPhoneTouchTwoVC.h"

@interface GXPhoneTouchEventVC ()

@end

@implementation GXPhoneTouchEventVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"第一个";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addEventTouchSubView];
    
    

    
}

- (void)addEventTouchSubView
{
    GXPhoneTouchEventOneView *oneView = [[GXPhoneTouchEventOneView alloc] init];
    oneView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(50));
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
    }];

    
    UIView *twoView = [[UIView alloc] init];
    twoView.backgroundColor = [UIColor blueColor];
    twoView.frame = CGRectMake(50, 50, oneView.viewWidth-100, oneView.viewHeight - 100);
    [oneView addSubview:twoView];
    
    oneView.alpha = 0.0;
    
    // 疑惑
    // 系统会先调用animationBlock里的代码.
    // 然后直接调用下面的方法.
    // 最后又接着执行animationBlock里的动画.
    
    [UIView animateWithDuration:50 animations:^{
        
        NSLog(@"animation");
        oneView.alpha = 1;
    }];
    oneView.alpha = 0.5;
    NSLog(@"外部");
    
    
    
    
    
    
    
    
    
    
    
    UIButton *touchBtn = [[UIButton alloc] init];
    touchBtn.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:touchBtn];
    [touchBtn addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchUpInside];
    touchBtn.backgroundColor = [UIColor redColor];
}

- (void)touchBtn
{
    GXPhoneTouchTwoVC *vc = [[GXPhoneTouchTwoVC alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"++%@-%@-响应链",NSStringFromClass([self class]), NSStringFromSelector(@selector(touchesBegan:withEvent:)));
    [super touchesBegan:touches withEvent:event];
}


@end
