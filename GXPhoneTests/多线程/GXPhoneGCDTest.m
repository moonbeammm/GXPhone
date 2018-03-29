//
//  GXPhoneGCDTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/28.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneGCDTest : XCTestCase

@end

@implementation GXPhoneGCDTest

- (void)testExample {

    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group, queue, ^{
        NSLog(@"任务一 >> %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"任务二 >> %@",[NSThread currentThread]);
    });

    dispatch_group_notify(group, queue, ^{
        NSLog(@"任务一二都执行完了 >> %@",[NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"任务三 >> %@",[NSThread currentThread]);
    });
    NSLog(@"我是在主线程.notify方法后面的打印");
    
    dispatch_async(queue, ^{
        NSLog(@"我是在notify后面执行的方法 >>%@",[NSThread currentThread]);
    });
    /*
     我是在主线程.notify方法后面的打印
     
     任务一 >> <NSThread: 0x7fcb8e459fb0>{number = 2, name = (null)}
     
     我是在notify后面执行的方法 >><NSThread: 0x7f89d8744af0>{number = 5, name = (null)}
     
     任务二 >> <NSThread: 0x7fcb8e580df0>{number = 3, name = (null)}
     任务三 >> <NSThread: 0x7fcb8e716be0>{number = 4, name = (null)}
     
     任务一二都执行完了 >> <NSThread: 0x7fcb8e716be0>{number = 4, name = (null)}
     */
    /*
     总结:
     就算在notify之后加入的block也会受到notify的限制.
     这点和operationQueue的wait有区别
     */
}


- (void)testBarrierAsync {

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"任务一 >> %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务二 >> %@",[NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier任务 >> %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"barrier任务后的任务 >> %@",[NSThread currentThread]);
    });
    /*
     任务二 >> <NSThread: 0x7fb074d3ff80>{number = 3, name = (null)}
     barrier任务后的任务 >> <NSThread: 0x7fb074c310b0>{number = 4, name = (null)}
     barrier任务 >> <NSThread: 0x7fb074e49f00>{number = 5, name = (null)}
     任务一 >> <NSThread: 0x7fb074c20170>{number = 2, name = (null)}
     */
    /*
     barrier_async完全没起到任何作用
     */
}

- (void)testBarrierSync {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"任务一 >> %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务二 >> %@",[NSThread currentThread]);
    });
    dispatch_barrier_sync(queue, ^{
        NSLog(@"barrier任务 >> %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"barrier任务后的任务 >> %@",[NSThread currentThread]);
    });
    /*
     barrier任务 >> <NSThread: 0x7ff007f061b0>{number = 1, name = main}
     任务一 >> <NSThread: 0x7ff007d3bbc0>{number = 2, name = (null)}
     任务二 >> <NSThread: 0x7ff007e45380>{number = 3, name = (null)}
     barrier任务后的任务 >> <NSThread: 0x7ff007e45380>{number = 3, name = (null)}
     */
    /*
     barrier_sync完全没起到任何作用
     */
}

- (void)testSerialQueueBarrierSync {
    dispatch_queue_t queue = dispatch_queue_create("hehe", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"任务一 >> %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:4];
        NSLog(@"任务二 >> %@",[NSThread currentThread]);
    });
    dispatch_barrier_sync(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"barrier任务 >> %@",[NSThread currentThread]);
    });
    NSLog(@"barrier任务后的任务 >> %@",[NSThread currentThread]);
    /*
     任务一 >> <NSThread: 0x7fbfd1e77f10>{number = 2, name = (null)}
     任务二 >> <NSThread: 0x7fbfd1e77f10>{number = 2, name = (null)}
     barrier任务 >> <NSThread: 0x7fbfd1e061b0>{number = 1, name = main}
     barrier任务后的任务 >> <NSThread: 0x7fbfd1e77f10>{number = 2, name = (null)}
     */
    /*
     barrier只能拦截串行队列.
     如果是并行队列只能用dispatch_notify或者OperationQueue的wait
     */
    /**/
}

- (void)testSerialQueueBarrierAsync {
    dispatch_queue_t queue = dispatch_queue_create("hehe", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"任务一 >> %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务二 >> %@",[NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"barrier任务 >> %@",[NSThread currentThread]);
    });
    
    NSLog(@"barrier任务后的任务 >> %@",[NSThread currentThread]);

    [NSThread sleepForTimeInterval:4];
    /*
     任务一 >> <NSThread: 0x7fc424d6b780>{number = 2, name = (null)}
     barrier任务后的任务 >> <NSThread: 0x7f9fe07042c0>{number = 1, name = main}
     任务二 >> <NSThread: 0x7fc424d6b780>{number = 2, name = (null)}
     barrier任务 >> <NSThread: 0x7fc424d6b780>{number = 2, name = (null)}
     barrier任务后的任务 >> <NSThread: 0x7fc424d6b780>{number = 2, name = (null)}
     */
    /*
     barrier_async拦截的block是在子线程执行的.
     这点和barrier_sync在主线程执行不同.
     */
}

@end
