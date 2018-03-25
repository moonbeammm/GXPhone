//
//  GXPhoneNotificationThreadTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/25.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneNotificationThreadTest : XCTestCase

@end

@implementation GXPhoneNotificationThreadTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"sgx>> 异步线程添加通知AsyncNotification >> %@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationSelector:) name:@"AsyncNotification" object:nil];
    });
    
    NSLog(@"sgx>> 主线程添加通知MainThreadNotification >> %@",[NSThread currentThread]);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationSelector:) name:@"MainThreadNotification" object:nil];
}

- (void)notificationSelector:(NSNotification *)notification {
    NSLog(@"sgx>> 执行通知方法 >> %@ >> %@",[NSThread currentThread],notification.name);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [NSThread sleepForTimeInterval:3];
    
    /// 主线程post通知
    NSLog(@"sgx>> 主线程post通知AsyncNotification >> %@",[NSThread currentThread]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AsyncNotification" object:nil];
    
    /// 异步线程post通知
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"sgx>> 子线程post通知MainThreadNotification >> %@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MainThreadNotification" object:nil];
    });

}
/*
 sgx>> 异步线程添加通知AsyncNotification >> <NSThread: 0x7fe097d74910>{number = 2, name = (null)}
 sgx>> 主线程post通知AsyncNotification >> <NSThread: 0x7fe097c05580>{number = 1, name = main}
 sgx>> 执行通知方法 >> <NSThread: 0x7fe097c05580>{number = 1, name = main} >> AsyncNotification

 sgx>> 主线程添加通知MainThreadNotification >> <NSThread: 0x7fe097c05580>{number = 1, name = main}
 sgx>> 子线程post通知MainThreadNotification >> <NSThread: 0x7fe097d74910>{number = 2, name = (null)}
 sgx>> 执行通知方法 >> <NSThread: 0x7fe097d74910>{number = 2, name = (null)} >> MainThreadNotification
 
 所以执行通知方法在哪个线程执行取决于 你在哪个线程post通知.
 */

@end
