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

#import <GXPageView/GXPageContainerView.h>

@interface GXPhonePageViewVC ()

@end

@implementation GXPhonePageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self addMLMTest];
    [self addGXContainerTest];
    
    
    
}

- (void)addGXContainerTest
{
    NSArray *contents = [self vcArr:4];
    GXPageContainerView *containerView = [[GXPageContainerView alloc] initWithParentVC:self contents:contents argv:nil];
    [self.view addSubview:containerView];
    containerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)addMLMTest
{
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
        vc.title = [NSString stringWithFormat:@"title-%zd",i];
        [arr addObject:vc];
    }
    return arr;
}


@end
