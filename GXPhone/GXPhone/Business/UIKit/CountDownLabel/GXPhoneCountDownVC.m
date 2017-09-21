//
//  GXPhoneCountDownVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/9/21.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneCountDownVC.h"

@interface GXPhoneCountDownVC ()

@property (nonatomic, strong) UILabel *countDownLabel;

@end

@implementation GXPhoneCountDownVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configSubviews];
    [self countDown];
}

#pragma mark - Public Method

#pragma mark - Event Response

#pragma mark - Private Method

- (void)countDown
{
    __block int timeout = 61; // 倒计时时间
    self.countDownLabel.text = [NSString stringWithFormat:@"接收短信大概需要%d秒钟", timeout];
    self.countDownLabel.textColor = [UIColor lightGrayColor];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create((DISPATCH_SOURCE_TYPE_TIMER), 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC); // 每秒执行
    dispatch_source_set_event_handler(timer, ^{
        timeout--;
        if (timeout <= 0) {
            // 倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                // 结束                
                
            });
        } else {
            NSString * strTime = [NSString stringWithFormat:@"接收短信大概需要%d秒钟", timeout];
            dispatch_async(dispatch_get_main_queue(), ^{
                // 更新timeLabel的显示
                self.countDownLabel.text = strTime;
            });
        }
    });
    dispatch_resume(timer);
}

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.view addSubview:self.countDownLabel];
    self.countDownLabel.frame = CGRectMake(100, 200, 200, 100);
}

- (UILabel *)countDownLabel
{
    if (_countDownLabel == nil) {
        _countDownLabel = [[UILabel alloc] init];
        _countDownLabel.backgroundColor = [UIColor whiteColor];
        _countDownLabel.font = [UIFont systemFontOfSize:13];
        _countDownLabel.textColor = [UIColor lightGrayColor];
    }
    return _countDownLabel;
}

@end
