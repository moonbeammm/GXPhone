//
//  GXPhoneTryCatchTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/18.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneTryCatchTest : XCTestCase

@end

@implementation GXPhoneTryCatchTest

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
    @try {
        @throw
        [NSException exceptionWithName:NSInternalInconsistencyException reason:@"不要调用setUp方法." userInfo:nil];
    } @catch(NSException *exception) {
        NSLog(@"我抓到异常了!!");
    } @finally {
        
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end