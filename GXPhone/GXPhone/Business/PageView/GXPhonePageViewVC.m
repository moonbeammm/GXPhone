//
//  GXPhonePageViewVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/30.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhonePageViewVC.h"
#import <GXPageView/GXPageContainerView.h>

@interface GXPhonePageViewVC ()

@end

@implementation GXPhonePageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
