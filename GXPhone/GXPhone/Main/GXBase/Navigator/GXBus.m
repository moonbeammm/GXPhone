//
//  GXBus.m
//  GX-Fog
//
//  Created by sunguangxin on 16/11/18.
//  Copyright © 2016年 GX. All rights reserved.
//

#import "GXBus.h"
#import "BiliBusModel.h"
#import "BiliBusValidator.h"

@implementation GXBus

- (BiliBusModel *)callFunction:(NSString *)function withModel:(BiliBusModel *)model
{
    BiliBusModel *resultModel = nil;
    function = [function lowercaseString];
    if ([function isEqualToString:@"main/mine"]) {
        BiliBusValidator *validator = [BiliBusValidator new];
        [validator setStringValidationForKey:@"buyVipType"];
        if ([validator validateModel:model]) {
//            NSString *type = [model stringValueForKey:@"buyVipType"];
//            NSString *title = [model stringValueForKey:@"title"];
            resultModel = [BiliBusModel new];
            UIViewController *buyVipVC = [[UIViewController alloc] init];
            [resultModel setControllerValue:buyVipVC forKey:@"vc"];
        }
    }
    return resultModel;
}

@end
