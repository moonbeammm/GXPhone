//
//  GXPhoneBlockTypeTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/17.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneBlockTypeTest : XCTestCase

@property (nonatomic, copy) void (^mallocBlock)(void);
@property (nonatomic, strong) NSArray *arrr;

@end

@implementation GXPhoneBlockTypeTest

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

}

/// 1.globalBlock
/// 没有用到外界变量或只用到全局变量、静态变量的block为_NSConcreteGlobalBlock，生命周期从创建到应用程序结束。
- (void)testCreateGlobalTypeBlock {
    void (^globalBlock)(void) = ^{

    };
    NSLog(@"没有捕获外界变量.所以是__NSGlobalBlock__ >> %@",globalBlock);
    globalBlock();
}


/// 2.mallocBlock
/// block捕获了外界变量就会被copy到堆中.变成mallocBlock类型.
/// 跟这个block有没有被强引用或者copy没有关系.
- (void)testCreateMallocTypeBlock {
    self.mallocBlock = ^{
        
    };
    NSLog(@"没有捕获外界变量.所以是globalBlock >>%@",self.mallocBlock);
    self.mallocBlock();
    /////////////////////////////////////////////////////////////
    
    
    void (^globalBlock1)(void) = ^{

    };
    NSLog(@"没有捕获外界变量.所以是globalBlock >>%@",globalBlock1);
    globalBlock1();
    ///////////////////////////////////////////////////////////////
    
    
    NSArray *arr =@[@"1"];
    void (^globalBlock2)(void) = ^{
        NSLog(@"arr>> %p >> %p",arr,&arr);
    };
    NSLog(@"捕获了外界变量.所以是mallocBlock >>%@",globalBlock2);
    globalBlock2();
    ////////////////////////////////////////////////////////////////
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
