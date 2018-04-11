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
#import "GXPhoneTouchEventThreeView.h"
#import "GXPhoneTouchEventButton.h"
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
    
//    GXPhoneTouchEventVCTest *ccc = [GXPhoneTouchEventVCTest new];
    
    

    
}

- (void)addEventTouchSubView
{
    GXPhoneTouchEventOneView *oneView = [[GXPhoneTouchEventOneView alloc] init];
    oneView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(20));
        make.right.equalTo(@(-20));
        make.bottom.equalTo(@(-50));
        
    }];

    

    
    

    
    
    GXPhoneTouchEventThreeView *threeView = [[GXPhoneTouchEventThreeView alloc] init];
    threeView.backgroundColor = [UIColor greenColor];
    
    [oneView addSubview:threeView];
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(20));
        make.right.bottom.equalTo(@(-20));
    }];
    
    
    
    
    
    GXPhoneTouchEventTwoView *twoView = [[GXPhoneTouchEventTwoView alloc] init];
    twoView.backgroundColor = [UIColor blueColor];
    [threeView addSubview:twoView];
    [twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(20));
        make.right.bottom.equalTo(@(-20));
    }];
    
    
    GXPhoneTouchEventButton *touchBtn = [[GXPhoneTouchEventButton alloc] init];
    [threeView addSubview:touchBtn];
    [touchBtn addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchUpInside];
    touchBtn.backgroundColor = [UIColor redColor];
    
    [touchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(20));
        make.right.bottom.equalTo(@(-20));
    }];
    
    
    

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


