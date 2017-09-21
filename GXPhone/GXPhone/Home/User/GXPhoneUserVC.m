//
//  GXPhoneUserVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneUserVC.h"
#import <GXNetwork/GXNetworkManager.h>
#import <GXRuler/GXImageManager.h>

@interface GXPhoneUserVC ()

@property (nonatomic, strong) UILabel *countDownLabel;

@end

@implementation GXPhoneUserVC

- (instancetype)init
{
    if (self = [super init]) {
        self.tabBarItem.image = GXImageMake(GXPhone,@"home_mine_tab");
        self.tabBarItem.selectedImage = GXImageMake(GXPhone,@"home_mine_tab_s");
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.countDownLabel];
    self.countDownLabel.frame = CGRectMake(100, 200, 200, 100);
    [self countDown];
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

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
