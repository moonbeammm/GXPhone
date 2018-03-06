//
//  GXPhoneJSVC.m
//  GXPhone
//
//  Created by sgx on 2018/3/6.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneJSVC.h"
#import "GXPhoneJSModel.h"

@interface GXPhoneJSVC ()

@end

@implementation GXPhoneJSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"开始");
    for (NSInteger i = 0; i < 1000; i++) {
        [GXPhoneJSModel parseByJavaScriptWithRawContent:@""];
    }
    NSLog(@"结束");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
