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
        self.title = @"传递链/响应链";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addEventTouchSubView];
}

- (void)addEventTouchSubView
{
    GXPhoneTouchEventOneView *oneView = [[GXPhoneTouchEventOneView alloc] init];
    oneView.backgroundColor = [UIColor purpleColor];
    oneView.frame = CGRectMake(20, 50, self.view.viewWidth, 400);

    GXPhoneTouchEventTwoView *twoView = [[GXPhoneTouchEventTwoView alloc] init];
    twoView.backgroundColor = [UIColor blueColor];
    twoView.frame = CGRectMake(20, 20, self.view.viewWidth, 400);

    GXPhoneTouchEventThreeView *threeView = [[GXPhoneTouchEventThreeView alloc] init];
    threeView.backgroundColor = [UIColor greenColor];
    threeView.frame = CGRectMake(20, 20, self.view.viewWidth, 400);

    GXPhoneTouchEventButton *touchBtn = [[GXPhoneTouchEventButton alloc] init];
    touchBtn.backgroundColor = [UIColor redColor];
    touchBtn.frame = CGRectMake(20, 20, self.view.viewWidth, 400);

    
    // oneview 紫色
    // twoview 蓝色
    // threeview 绿色
    // touchBtn 红色
    [self.view addSubview:oneView];
    [oneView addSubview:twoView];
    [twoView addSubview:threeView];
//    [threeView addSubview:touchBtn];
}



//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"响应链 >> vc");
//    [super touchesBegan:touches withEvent:event];
//}

@end


