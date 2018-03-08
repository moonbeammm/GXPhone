//
//  GXPhoneArithmeticTest.m
//  GXPhoneTests
//
//  Created by sgx on 2018/3/7.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GXPhoneArithmeticHelper.h"

@interface GXPhoneArithmeticTest : XCTestCase

@end

@implementation GXPhoneArithmeticTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInsetSortExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray * arry = [GXPhoneArithmeticHelper insertSortWithArray:@[@(5),@(7),@(1),@(10),@(39),@(8)]];
    BOOL equal = [arry isEqualToArray:@[@(1),@(5),@(7),@(8),@(10),@(39)]];
    NSAssert(equal, @"排序出错了!");
}

- (void)testRemoveRepeatExample {
    for (int i = 0; i < 10000; i++) {
        NSArray *arry = [GXPhoneArithmeticHelper removeRepeatWithArray:@[@"1",@"3",@"1",@"1",@"2",@"2",@"3"]];
        BOOL equal = [arry isEqualToArray:@[@"3",@"1",@"2"]];
        NSString *error = [NSString stringWithFormat:@"去重出错了! arry:>> %@",arry];
        NSAssert(equal, error);
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
