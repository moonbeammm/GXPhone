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
    NSData *jsonData = [NSData dataWithContentsOfFile:kLibraryDirectory(@"card_model.json")];
    if (!jsonData) {
        NSURL *url1 = [NSURL URLWithString: @"http://www.sunxxxxx.com/images/card_model.json"];
        NSData *data1 = [NSData dataWithContentsOfURL:url1];
        [data1 writeToFile:kLibraryDirectory(@"card_model.json") atomically:YES];
    }
    NSData *nibData = [NSData dataWithContentsOfFile:kLibraryDirectory(@"GXHomeRecGameCell.nib")];
    if (!nibData) {
        NSURL *url = [NSURL URLWithString: @"http://www.sunxxxxx.com/images/GXHomeRecGameCell.nib"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        [data writeToFile:kLibraryDirectory(@"GXHomeRecGameCell.nib") atomically:YES];
    }
}

@end
