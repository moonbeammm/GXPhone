//
//  GXPhoneRuntimeTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/17.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>

@interface GXPhoneRuntimeTest : XCTestCase

@end

@implementation GXPhoneRuntimeTest

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
    unsigned int propertyCount;
    objc_property_t *propertys = class_copyPropertyList([NSObject class], &propertyCount);
    NSLog(@"%@",propertys[0]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
