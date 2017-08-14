//
//  GXPhoneBus.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/11.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneBus.h"

#import "GXPhoneBusTestVC.h"

@implementation GXPhoneBus

// 须知
// 1.A库可以通过bus获取B库里的任何东西.只要在这里注册就可以了(不是只能获取VC.resultModel里能保存什么就能给其他库什么东西)

// 注意
// 1.注册的function(url)必须是小写

- (GXBusModel *)callFunction:(NSString *)function withModel:(GXBusModel *)model
{
    GXBusModel *resultModel = nil;
    function = [function lowercaseString];
    if ([function isEqualToString:@"main/bus_test_vc"]) {

        GXBusValidator *validator = [GXBusValidator new];
        // 测试传递viewModel
        // [validator setViewModelValidationForKey:@"info_viewModel"];
        [validator setStringValidationForKey:@"from"];
        if ([validator validateModel:model]) {
            // viewModel/from为外界传进来的参数
            NSObject *viewModel = (NSObject *)[model viewModelValueForKey:@"viewModel"];
            NSString *from = (NSString *)[model viewModelValueForKey:@"from"];
            NSLog(@"GXPhoneBus-callFunction-url:%@,viewModel:%@,from:%@",function,viewModel,from);
            // 创建vc
            UIViewController *vc = [[GXPhoneBusTestVC alloc] init];
            // 通过vc和params创建保存vc的busModel
            resultModel = [GXBusModel new];
            [resultModel setControllerValue:vc forKey:@"vc"];
        }
    }
    return resultModel;
}

@end
