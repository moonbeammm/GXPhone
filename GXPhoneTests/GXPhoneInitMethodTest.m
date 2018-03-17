//
//  GXPhoneInitMethodTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/17.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GXPhoneChild.h"

@interface GXPhoneInitMethodTest : XCTestCase

@end

@implementation GXPhoneInitMethodTest

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
    
    /// 测试最好不要在init方法里通过self调用属性.
    GXPhoneChild *child = [[GXPhoneChild alloc] init];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
