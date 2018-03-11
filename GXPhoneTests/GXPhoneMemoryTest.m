//
//  GXPhoneMemoryTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/9.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneMemoryTest : XCTestCase

@property (nonatomic, strong) UIView *view;

@end

@implementation GXPhoneMemoryTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 测试引用计数
 */
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    UIView *view = [[UIView alloc] init];
    NSLog(@"tempArr 的retaincount >> %ld",CFGetRetainCount((__bridge CFTypeRef) view));
    self.view = view;
    NSLog(@"tempArr 的retaincount >> %ld",CFGetRetainCount((__bridge CFTypeRef) view));
    // 为啥用控制台的po打印和这里打印的retainCount不一致.
    // CFGetRetainCount是给CF库打印retainCount的.可能是这样导致的不准.
    NSLog(@"self.arrr 的retaincount >> %ld",CFGetRetainCount((__bridge CFTypeRef) self.view));
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
