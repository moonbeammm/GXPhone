//
//  main.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/29.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BiliBusMagiSystem.h"
#import "GXBus.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [BiliBusMagiSystem registerSubBus:[[GXBus alloc] initWithName:@"main"]];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
