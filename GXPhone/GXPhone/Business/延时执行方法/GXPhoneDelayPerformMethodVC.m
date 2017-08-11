//
//  GXPhoneDelayPerformMethodVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/9.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneDelayPerformMethodVC.h"

@interface GXPhoneDelayPerformMethodVC ()

@property (nonatomic, copy) dispatch_block_t blockTask;

@end

@implementation GXPhoneDelayPerformMethodVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"延时执行";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 方法一
    [self dispatchTest];
    // 方法二
    [self performDelayTest];
    // 方法三
    [self dispatchTaskTest];
    
    // 结论:
    // 只有方法一没有取消执行.
    // 也就是说dispathch_after方法必须手动取消.
    // 但是他不会强引用VC.VC会正常被释放
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 如果页面消失了.就取消延迟方法的执行.然后看这三种延迟方法谁仍然会执行
    
    // 1.dispath_after不能手动取消
    
    // 2.手动取消performSelector方法
    [self cancelPerform];
    
    // 3.手动取消dispatchBlock方法
    [self cancelDispatchBlockTask];
}

// 1.用dispatch_after执行延迟方法
- (void)dispatchTest
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"dispatch_after 延迟3秒执行任务!");
    });
}

// 2.用performSelector执行延迟方法
- (void)performDelayTest
{
    [self performSelector:@selector(perform) withObject:nil afterDelay:3];
}

- (void)perform
{
    NSLog(@"performSelector 延迟3秒执行任务!");
}

- (void)cancelPerform
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(perform) object:nil];
}

// 3.用performSelector执行延迟方法

- (void)dispatchTaskTest
{
    self.blockTask = dispatch_block_create(DISPATCH_BLOCK_BARRIER, ^{
        NSLog(@"dispatch_block  执行3秒延迟任务");
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3*NSEC_PER_SEC), dispatch_get_main_queue(), self.blockTask);
}

- (void)cancelDispatchBlockTask
{
    dispatch_block_cancel(self.blockTask);
}

@end
