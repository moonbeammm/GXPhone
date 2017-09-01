//
//  GXPhonePageViewVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/30.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhonePageViewVC.h"
#import <GXPageView/MLMSegmentHead.h>
#import <GXPageView/MLMSegmentScroll.h>
#import <GXPageView/MLMSegmentManager.h>

@interface GXPhonePageViewVC ()

@end

@implementation GXPhonePageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray * list = @[@"推荐",@"视频"];
    
    MLMSegmentHead *segHead = [[MLMSegmentHead alloc] initWithFrame:CGRectMake(0, 64, 375, 40) titles:list headStyle:SegmentHeadStyleLine layoutStyle:MLMSegmentLayoutLeft];
    segHead.fontScale = 1.1;
    
    MLMSegmentScroll *segScroll = [[MLMSegmentScroll alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segHead.frame), 375, 600-CGRectGetMaxY(segHead.frame)) vcOrViews:[self vcArr:list.count]];
    segScroll.loadAll = YES;
    
    [MLMSegmentManager associateHead:segHead withScroll:segScroll completion:^{
        [self.view addSubview:segHead];
        [self.view addSubview:segScroll];
    }];
    
    
}



- (NSArray *)vcArr:(NSInteger)count {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i ++) {
        UIViewController *vc = [UIViewController new];
        vc.view.backgroundColor = [UIColor redColor];
//        vc.index = i;
        [arr addObject:vc];
    }
    return arr;
}


@end