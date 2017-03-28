//
//  BiliReachability.h
//  ibiliplayer
//
//  Created by HarrisonXi on 15/8/4.
//  Copyright (c) 2015年 bilibili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa/ReactiveCocoa.h"
#import "Reachability.h"

@interface BiliReachability : NSObject

+ (NetworkStatus)currentStatus; // 当前网络状态
+ (RACSignal *)statusSignal; // 使用此信号获取网络状态更改

+ (BOOL)isReachable; // 可以联通网络
+ (BOOL)isReachableViaWWAN; // 通过2G/3G/4G联网
+ (BOOL)isReachableViaWiFi; // 通过WiFi联网

@end
