//
//  GXPhoneCALayerVC.m
//  GXPhone
//
//  Created by sgx on 2018/6/15.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneCALayerVC.h"

static NSInteger WIDTH = 50;

@interface GXPhoneCALayerVC ()
@property (nonatomic, strong) CALayer *layer;

@end

@implementation GXPhoneCALayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drawMyLayer];
}

#pragma mark 绘制图层 隐式动画

/**
 支持隐式动画的几个参数
 anchorPoint
 backgroundColor
 borderColor
 borderWidth
 bounds
 */
-(void)drawMyLayer{
    CGSize size=[UIScreen mainScreen].bounds.size;
    //获得根图层
    self.layer=[[CALayer alloc]init];
    //设置背景颜色,由于QuartzCore是跨平台框架，无法直接使用UIColor
    self.layer.backgroundColor=[UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    //设置中心点
    self.layer.position=CGPointMake(size.width/2, size.height/2);
    //设置大小
    self.layer.bounds=CGRectMake(0, 0, WIDTH,WIDTH);
    //设置圆角,当圆角半径等于矩形的一半时看起来就是一个圆形
    self.layer.cornerRadius=WIDTH/2;
    //设置阴影
    self.layer.shadowColor=[UIColor grayColor].CGColor;
    self.layer.shadowOffset=CGSizeMake(2, 2);
    self.layer.shadowOpacity=.9;
    //设置边框
    self.layer.borderColor=[UIColor blackColor].CGColor;
    self.layer.borderWidth=1;
    //设置锚点
    //    layer.anchorPoint=CGPointZero;
    [self.view.layer addSublayer:self.layer];
}
#pragma mark 点击放大
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CGFloat width=self.layer.bounds.size.width;
    if (width==WIDTH) {
        width=WIDTH*4;
        self.layer.backgroundColor = [UIColor yellowColor].CGColor;
        self.layer.borderWidth = 2;
    }else{
        width=WIDTH;
        self.layer.backgroundColor = [UIColor redColor].CGColor;
        self.layer.borderWidth = 3;
    }
    self.layer.bounds=CGRectMake(0, 0, width, width);
    self.layer.position=[touch locationInView:self.view];
    self.layer.cornerRadius=width/2;
}

@end
