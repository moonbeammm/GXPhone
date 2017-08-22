//
//  GXPhoneTouchEventVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/22.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneTouchEventVC.h"
#import <GXRuler/UIView+Frame.h>
#import "GXPhoneTouchEventOneView.h"
#import "GXPhoneTouchEventTwoView.h"

@interface GXPhoneTouchEventVC ()

@end

@implementation GXPhoneTouchEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addEventTouchSubView];
}

- (void)addEventTouchSubView
{
    GXPhoneTouchEventOneView *oneView = [[GXPhoneTouchEventOneView alloc] init];
    oneView.backgroundColor = [UIColor redColor];
    oneView.frame = CGRectMake(50, 50, self.view.viewWidth-100, self.view.viewHeight - 200);
    [self.view addSubview:oneView];
//    oneView.hidden = YES;
//    oneView.alpha = 0;
    
    GXPhoneTouchEventTwoView *twoView = [[GXPhoneTouchEventTwoView alloc] init];
    twoView.backgroundColor = [UIColor blueColor];
    twoView.frame = CGRectMake(50, 50, oneView.viewWidth-100, oneView.viewHeight - 100);
    [oneView addSubview:twoView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"++%@-%@-响应链",NSStringFromClass([self class]), NSStringFromSelector(@selector(touchesBegan:withEvent:)));
    [super touchesBegan:touches withEvent:event];
}


@end
