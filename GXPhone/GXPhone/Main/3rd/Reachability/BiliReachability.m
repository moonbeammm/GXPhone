//
//  BiliReachability.m
//  ibiliplayer
//
//  Created by HarrisonXi on 15/8/4.
//  Copyright (c) 2015年 bilibili. All rights reserved.
//

#import "BiliReachability.h"

@interface BiliReachability ()

@property (nonatomic, strong) Reachability *reach;
@property (atomic   , assign) NetworkStatus status;
@property (nonatomic, strong) RACSubject *subject;

@end

@implementation BiliReachability

+ (BiliReachability *)sharedReachability
{
    static BiliReachability *sharedReachability_;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedReachability_ = [BiliReachability new];
        [[NSNotificationCenter defaultCenter] addObserver:sharedReachability_
                                                 selector:@selector(reachNotifHandler:)
                                                     name:kReachabilityChangedNotification
                                                   object:nil];
        if ([NSThread isMainThread]) {
            [sharedReachability_.reach startNotifier];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [sharedReachability_.reach startNotifier];
            });
        }
    });
    
    return sharedReachability_;
}

+ (NetworkStatus)currentStatus
{
    return [BiliReachability sharedReachability].status;
}

+ (RACSignal *)statusSignal
{
    return [BiliReachability sharedReachability].subject;
}

+ (BOOL)isReachable
{
    return [BiliReachability sharedReachability].status != NotReachable;
}

+ (BOOL)isReachableViaWiFi
{
    return [BiliReachability sharedReachability].status == ReachableViaWiFi;
}

+ (BOOL)isReachableViaWWAN
{
    return [BiliReachability sharedReachability].status == ReachableViaWWAN;
}

- (instancetype)init
{
    if (self = [super init]) {
        _reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
        _status = [self.reach currentReachabilityStatus];
        _subject = [RACSubject subject];
    }
    return self;
}

- (void)reachNotifHandler:(NSNotification *)notification
{
    Reachability* reach = [notification object];
    if (reach && reach == self.reach && self.status != [reach currentReachabilityStatus]) {
        self.status = [reach currentReachabilityStatus];
        [self.subject sendNext:@(self.status)];
    }
}

@end
