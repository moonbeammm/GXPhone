//
//  GXPhoneIsKindOfClassTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/18.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GXPhoneChild.h"

@interface GXPhoneIsKindOfClassTest : XCTestCase

@end

@implementation GXPhoneIsKindOfClassTest

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
    GXPhoneChild *child = [GXPhoneChild new];
    
    /// 判断出对象是否为某个特定类的实例.
    [child isMemberOfClass:[GXPhoneChild class]]; // YES
    [child isMemberOfClass:[GXPhoneFather class]]; // NO
    
    /// 判断出对象是否为某类或其派生类的实例.
    [child isKindOfClass:[GXPhoneChild class]]; // YES;
    [child isKindOfClass:[GXPhoneFather class]]; // YES
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
