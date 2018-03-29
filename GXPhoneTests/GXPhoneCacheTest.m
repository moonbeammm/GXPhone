//
//  GXPhoneCacheTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/30.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneCacheTest : XCTestCase

@end

@implementation GXPhoneCacheTest

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
    NSCache *cache = [NSCache new];
    [cache setValue:@"sgx" forKey:@"name"];
    [cache setValue:@"yt" forKey:@"name"];
    NSLog(@"%@",cache);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
