//
//  GXPhonePointerTest.m
//  GXPhoneTests
//
//  Created by sgx on 2018/3/18.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhonePointerTest : XCTestCase

@end

@implementation GXPhonePointerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    int i;
    int c;
    
    c = 10;
    i = 5;
    
    /// 创建了两个连续的整型.打印他们的地址.
    /// 可以看出i,c的地址都存在栈区.并且相差4个字节.
    /// 正好是整型的大小.
    printf("%p \n",&i); /// 0x7ffeefbff62c
    printf("%p \n",&c); /// 0x7ffeefbff628
    
    /// &i
    int *p = &i;
    printf("%p %d \n",p,*p); /// 0x7ffeefbff62c   5
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
