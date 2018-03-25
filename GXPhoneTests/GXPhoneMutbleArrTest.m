//
//  GXPhoneMutbleArrTest.m
//  GXPhoneTests
//
//  Created by sgx on 2018/3/22.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneMutbleArrTest : XCTestCase

@end

@implementation GXPhoneMutbleArrTest

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
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:@[@0,@1,@2,@3,@4,@5,@6]];
    [mutArr removeObjectsInRange:NSMakeRange(2, mutArr.count - 2)];
    NSLog(@"%@",mutArr);
    /*
     删除从location开始(包含location)后面n个元素.
     
     2018-03-22 21:09:17.239674+0800 xctest[23420:606558] (
     0,
     1,
     5,
     6
     )
     */
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
