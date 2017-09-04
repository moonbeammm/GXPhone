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
#import <Masonry/Masonry.h>

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
    oneView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:oneView];
    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(50));
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
    }];
//    oneView.frame = CGRectMake(50, 50, self.view.viewWidth-100, self.view.viewHeight - 200);
    
//    oneView.hidden = YES;
//    oneView.alpha = 0;
    
    UIView *twoView = [[UIView alloc] init];
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
