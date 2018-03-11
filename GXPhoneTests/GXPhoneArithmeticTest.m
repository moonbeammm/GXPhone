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

@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, strong) NSArray *resultArr;
@end

@implementation GXPhoneArithmeticTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.arr = @[@(50),@(7),@(1),@(10),@(39),@(8)];
    self.resultArr = @[@(1),@(7),@(8),@(10),@(39),@(50)];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 测试快速排序算法.
 */

- (void)testInsetSortExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray * arry = [GXPhoneArithmeticHelper insertSortWithArray:self.arr];
    BOOL equal = [arry isEqualToArray:self.resultArr];
    NSAssert(equal, @"插入排序出错了!");
}

- (void)testBubbleSortExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray * arry = [GXPhoneArithmeticHelper bubbleSortWithArray:self.arr];
    BOOL equal = [arry isEqualToArray:self.resultArr];
    NSAssert(equal, @"冒泡排序出错了!");
}

- (void)testselectSortExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray * arry = [GXPhoneArithmeticHelper selectSortWithArray:self.arr];
    BOOL equal = [arry isEqualToArray:self.resultArr];
    NSAssert(equal, @"选择排序出错了!");
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
