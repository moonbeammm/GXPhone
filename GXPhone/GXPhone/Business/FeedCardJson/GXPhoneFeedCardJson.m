//
//  GXPhoneFeedCardJson.m
//  GXPhone
//
//  Created by sunguangxin on 2018/1/5.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneFeedCardJson.h"
#import <GXNetwork/GXNetworkManager.h>

@implementation GXPhoneFeedCardJson

+ (void)getHomeFeedCardJson {
    GXApiOptions *options = [[GXApiOptions alloc] init];
    options.baseUrl = @"http://www.sunxxxxx.com";
    options.modelDescriptions = @[[GXApiModelDescription modelWith:@"data" mappingClass:[NSDictionary class] isArray:NO]];
    
    [[[GXNetworkManager alloc] initWithOptions:options progress:^(NSProgress * _Nullable downloadProgress) {
        NSLog(@"ViewController: progress: %@",downloadProgress);
    } success:^(NSDictionary * _Nullable result, NSURLResponse * _Nullable response) {
        NSDictionary *data = result[@"data"];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:data forKey:@"av_card_of_375"];
        NSLog(@"ViewController: \ntask: \n%@\nresponseObject:\n%@",result,response);
    } failure:^(NSDictionary * _Nullable result, NSError * _Nullable error) {
        NSLog(@"ViewController: task: %@>>>>error:%@",result,error);
    }] requestAsync];
}

@end
