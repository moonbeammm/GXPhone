//
//  GXPhoneRetainCountTest.m
//  GXPhoneTests
//
//  Created by sgx on 2018/3/10.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>




@interface test : NSObject

@end

@implementation test

- (void)dealloc {
    
    NSLog(@"test被释放了 %p",self);
    
}

@end



@interface GXPhoneRetainCountTest : XCTestCase

@property (nonatomic, strong) NSString *aaaa;

@end

@implementation GXPhoneRetainCountTest

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
    
    @autoreleasepool {
        CFArrayRef arrr =(__bridge CFTypeRef)[test new];
        //    CFRelease(arrr);
        NSLog(@"arr retainCount : %ld",CFGetRetainCount(arrr));
        //    self.aaaa = arr;
        NSLog(@"arr retainCount : %ld",CFGetRetainCount(arrr));
    }


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
