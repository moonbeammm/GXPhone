//
//  GXPhonePageViewVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/30.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhonePageViewVC.h"
#import <GXPageView/GXPageContainerView.h>
#import "GXPhoneRACDisposerShare.h"

@interface GXPhonePageViewVC ()

@property (nonatomic, strong) NSString *name;

@end

@implementation GXPhonePageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"孙广鑫!!";
    @weakify(self);
    [RACObserve([GXPhoneRACDisposerShare shared], name) subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"sunguangxin:%@",self.name);
        
    }];
    
    UIButton *buttn = [[UIButton alloc] init];
    buttn.backgroundColor = [UIColor redColor];
    [self.view addSubview:buttn];
    buttn.frame = CGRectMake(100, 100, 50, 50);
    [buttn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick
{
    [GXPhoneRACDisposerShare shared].name = @"hahahah";
}


- (void)dealloc
{
    NSLog(@"dealloc");
}

@end
