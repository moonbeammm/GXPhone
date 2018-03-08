//
//  GXPhoneBlockVC.m
//  GXPhone
//
//  Created by sgx on 2018/3/7.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneBlockVC.h"

@interface GXPhoneBlockVC ()

@property (nonatomic, copy) void (^mallocBlock)(void);

@end

@implementation GXPhoneBlockVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    static int static_k = 3;
    self.automaticallyAdjustsScrollViewInsets
    /// 1.globalBlock
    /// 没有用到外界变量或只用到全局变量、静态变量的block为_NSConcreteGlobalBlock，生命周期从创建到应用程序结束。
    void (^globalBlock)(void) = ^{
        NSLog(@"");
    };
    NSLog(@"__NSGlobalBlock__ >> %@",globalBlock);
    globalBlock();
    
    
    /// 2.mallocBlock
    /// block捕获了外界变量就会被copy到堆中.变成mallocBlock类型.
    /// 跟这个block有没有被强引用或者copy没有关系.
    
    self.mallocBlock = ^{

    };
    NSLog(@"没有捕获外界变量.所以是globalBlock >>%@",self.mallocBlock);
    self.mallocBlock();
    /////////////////////////////////////////////////////////////
    void (^globalBlock1)(void) = ^{
        NSLog(@"");
    };
    NSLog(@"没有捕获外界变量.所以是globalBlock >>%@",globalBlock1);
    globalBlock1();
    ///////////////////////////////////////////////////////////////
    NSArray *arr =@[@"1"];
    NSLog(@"arr>> %p >> %p",arr,&arr);
    void (^globalBlock2)(void) = ^{
        NSLog(@"arr>> %p >> %p",arr,&arr);
    };
    NSLog(@"捕获了外界变量.所以是mallocBlock >>%@",globalBlock2);
    globalBlock2();
    ////////////////////////////////////////////////////////////////
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"没有捕获外界变量.所以是globalBlock >>%@",self.mallocBlock);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"没有捕获外界变量.所以是globalBlock >>%@",self.mallocBlock);
}

@end
