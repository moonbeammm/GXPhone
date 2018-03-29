//
//  GXPhoneTwoScrollSubVC.m
//  GXPhone
//
//  Created by sunguangxin on 2018/3/30.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneTwoScrollSubVC.h"

@interface GXPhoneTwoScrollSubVC ()

@end

@implementation GXPhoneTwoScrollSubVC

+ (void)load {
    [super load];
    NSLog(@"我是子类.重写了父类+load方法.%@",self);
}

+ (void)initialize {
    [super initialize];
    NSLog(@"sgx 我是子类.重写了initilize方法%@",self);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
