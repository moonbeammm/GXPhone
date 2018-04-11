//
//  GXPhoneRunloopTest.m
//  GXPhoneTests
//
//  Created by sgx on 2018/5/6.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneRunloopTest : XCTestCase
{
    BOOL _launchFinished;
}
@end

@implementation GXPhoneRunloopTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*
 1.使用sleep方法.并且是在异步线程修改launchFinished变量
 2018-05-06 16:14:16.250255+0800 xctest[4060:113622] while 内部
 2018-05-06 16:14:19.255499+0800 xctest[4060:113622] while 内部
 2018-05-06 16:14:19.255718+0800 xctest[4060:113622] viewDidLoad
 */
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        _launchFinished = YES;
    });
    
    BOOL launchFinished = NO;
    @synchronized(self) {
        launchFinished = _launchFinished;
    }
    while (!launchFinished) {
        @autoreleasepool {
            [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.f]];
            @synchronized(self) {
                launchFinished = _launchFinished;
            }
            NSLog(@"while 内部");
        }
    }
    NSLog(@"viewDidLoad");
}
/*
 1.使用sleep方法.并且在main queue修改变量
 2018-05-06 16:16:40.000335+0800 xctest[4165:117009] while 内部
 2018-05-06 16:16:43.004693+0800 xctest[4165:117009] while 内部
 2018-05-06 16:16:46.009687+0800 xctest[4165:117009] while 内部
 .
 .
 .
 .
 会造成死锁.一直无法执行dispatch after到主队列的方法.
 */
- (void)testExample1 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _launchFinished = YES;
    });
    
    BOOL launchFinished = NO;
    @synchronized(self) {
        launchFinished = _launchFinished;
    }
    while (!launchFinished) {
        @autoreleasepool {
            [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.f]];
            @synchronized(self) {
                launchFinished = _launchFinished;
            }
            NSLog(@"while 内部");
        }
    }
    NSLog(@"viewDidLoad");
}
/*
 1.使用runloop来达到sleep的效果.不会阻塞主线程.
 
 2018-05-06 16:18:46.737597+0800 xctest[4205:119054] while 内部
 2018-05-06 16:18:49.741522+0800 xctest[4205:119054] while 内部
 2018-05-06 16:18:49.741730+0800 xctest[4205:119054] viewDidLoad
 */
- (void)testExampleRunloop {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _launchFinished = YES;
    });
    
    BOOL launchFinished = NO;
    @synchronized(self) {
        launchFinished = _launchFinished;
    }
    while (!launchFinished) {
        @autoreleasepool {
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.f]];
            @synchronized(self) {
                launchFinished = _launchFinished;
            }
            NSLog(@"while 内部");
        }
    }
    NSLog(@"viewDidLoad");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


@end
