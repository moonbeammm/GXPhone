//
//  GXPhoneOperationTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/27.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneOperationTest : XCTestCase

@end

@implementation GXPhoneOperationTest

- (void)testBlockOperation {
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"执行完blockOperation >> %@",[NSThread currentThread]);
    }];
    
    [blockOperation addExecutionBlock:^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"执行完addExecutionBlock >> %@",[NSThread currentThread]);
    }];
    
    [blockOperation start];
    
    /*
     执行完blockOperation >> <NSThread: 0x7ffdf1c096e0>{number = 1, name = main}
     执行完addExecutionBlock >> <NSThread: 0x7ffdf1d37790>{number = 2, name = (null)}
     主线程 >> <NSThread: 0x7ffdf1c096e0>{number = 1, name = main}
     */
    
    /*
     blockOperation如果只有一个.那就会在当前线程执行.
     不会开辟新的线程
     
     如果有多个blockOperation时.系统可能会自动帮我们创建其他线程.
     */
}

- (void)testOperaton {
    
    NSOperation *operation = [[NSOperation alloc] init];
    operation.completionBlock = ^{
        NSLog(@"在wait方法后创建的operation >> %@",[NSThread currentThread]);
    };
    [operation start];
    /*
     在wait方法后创建的operation >> <NSThread: 0x7fde00545d70>{number = 2, name = (null)}
     */
}

- (void)testExample {

    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"one >> %@",[NSThread currentThread]);
    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"two >> %@",[NSThread currentThread]);
    }];
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"three >> %@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:4];
        /// 线程间通讯.注意.mainQueue这个方法只能在子线程使用.否则就死锁了.
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"four >> %@",[NSThread currentThread]);
        }];
    }];
    
    [operationQueue waitUntilAllOperationsAreFinished];
    NSLog(@"waitUntilAllOperationsAreFinished >> %@",[NSThread currentThread]);
    
    [operationQueue addOperationWithBlock:^{
        NSLog(@"在wait方法后加入 >> %@",[NSThread currentThread]);
    }];
    
    /*
     one >> <NSThread: 0x7fa370d399c0>{number = 2, name = (null)}
     two >> <NSThread: 0x7fa370c21a50>{number = 3, name = (null)}
     three >> <NSThread: 0x7fa370d42fc0>{number = 4, name = (null)}
     
     waitUntilAllOperationsAreFinished >> <NSThread: 0x7fa370e01a40>{number = 1, name = main}
     
     在wait方法后加入 >> <NSThread: 0x7fa370d42fc0>{number = 4, name = (null)}
     在wait方法后创建的operation >> <NSThread: 0x7fa370d42fc0>{number = 4, name = (null)}
     */
    /*
     总结一:
     把operation加入到queue里.Operation就会自动执行了.
     不需要调用类似operation的start方法
     */
    /*
     总结二:
     在wait方法后添加进queue的operation不会受到wait方法的阻挠.
     */
}

- (void)testInvocationOperation {
    NSOperationQueue * operationQueue = [[NSOperationQueue alloc] init];
    NSInvocationOperation *invocationOperation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperationSelector:) object:@"one"];
    NSInvocationOperation *invocationOperation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperationSelector:) object:@"two"];
    NSInvocationOperation *invocationOperation3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperationSelector:) object:@"three"];
    [operationQueue addOperation:invocationOperation1];
    [operationQueue addOperation:invocationOperation2];
    [operationQueue addOperation:invocationOperation3];
    
    
    [operationQueue waitUntilAllOperationsAreFinished];
    NSLog(@"waitUntilAllOperationsAreFinished");
    /*
     three  >>> thread :<NSThread: 0x7fe12d6668d0>{number = 3, name = (null)}
     two  >>> thread :<NSThread: 0x7fe12d470e70>{number = 2, name = (null)}
     one  >>> thread :<NSThread: 0x7fe12d735b80>{number = 4, name = (null)}
     waitUntilAllOperationsAreFinished
     */
    
    /*
     waitUntilAllOperationsAreFinished方法会拦截改queue的所有操作.直到他们都完成.
     */

    
}

- (void)invocationOperationSelector:(id)object {
    NSLog(@"%@  >>> thread :%@  queue: >> %@",object,[NSThread currentThread],[NSOperationQueue currentQueue]);
    [NSThread sleepForTimeInterval:1];
}

@end
