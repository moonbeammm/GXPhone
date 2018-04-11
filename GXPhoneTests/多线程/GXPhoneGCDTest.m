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

/////////////////////////////////////////dispatch_group_notify////////////////////////////////////////////////////////////////

/*
2018-05-06 17:08:08.188914+0800 xctest[5029:156892] done 后
2018-05-06 17:08:08.189036+0800 xctest[5029:156956] 任务一 >> <NSThread: 0x7fece35034c0>{number = 2, name = (null)}
2018-05-06 17:08:08.189036+0800 xctest[5029:156971] 任务二 >> <NSThread: 0x7fece365c8c0>{number = 3, name = (null)}
2018-05-06 17:08:08.189276+0800 xctest[5029:156971] done >> <NSThread: 0x7fece365c8c0>{number = 3, name = (null)}

总结:
1.dispatch_goup_notify不会阻塞当前线程.
*/
- (void)testExampleNotify {

    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group, queue, ^{
        NSLog(@"任务一 >> %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"任务二 >> %@",[NSThread currentThread]);
    });

    dispatch_group_notify(group, queue, ^{
        NSLog(@"done >> %@",[NSThread currentThread]);
    });
    
    NSLog(@"done 后");
}

/////////////////////////////////////////dispatch_wait////////////////////////////////////////////////////////////////

/*
 2018-05-06 17:18:38.300850+0800 xctest[5231:166382] 任务二
 2018-05-06 17:18:40.300925+0800 xctest[5231:166383] 任务一
 2018-05-06 17:18:40.301149+0800 xctest[5231:166293] 全部执行完成
 
 总结:
 1.dispatch_group_wait会阻塞当前线程.
 */
- (void)testDispatchGroupWait {
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"任务一");
    });
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"任务二");
    });
    
    /// 30 * NSEC_PER_SEC : 注意这里的单位别写错了.
    long result = dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, 30 * NSEC_PER_SEC));
    if (!result) {
        NSLog(@"全部执行完成");
    } else {
        NSLog(@"超时了.");
    }
}

/////////////////////////////////////////dispatch_barrier////////////////////////////////////////////////////////////////

/*
 2018-05-06 17:36:51.059000+0800 xctest[5633:182673] 任务一 >> <NSThread: 0x7f85bed52c20>{number = 2, name = (null)}
 2018-05-06 17:36:51.059000+0800 xctest[5633:182645] 任务二 >> <NSThread: 0x7f85bef588a0>{number = 3, name = (null)}
 2018-05-06 17:36:51.059033+0800 xctest[5633:182584] 主线程 >> <NSThread: 0x7f85bed061d0>{number = 1, name = main}
 2018-05-06 17:36:51.059292+0800 xctest[5633:182645] barrier任务 >>>>>>>>> <NSThread: 0x7f85bef588a0>{number = 3, name = (null)}
 2018-05-06 17:36:51.059468+0800 xctest[5633:182645] 任务三 >> <NSThread: 0x7f85bef588a0>{number = 3, name = (null)}
 
 dispatch_barrier_async不会阻塞主线程.因为他是异步的.
 */
- (void)testBarrierAsync {

    // 不能使用global_queue.否则会不起效果.
//     dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"任务一 >> %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务二 >> %@",[NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"barrier任务 >>>>>>>>> %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务三 >> %@",[NSThread currentThread]);
    });
    
    NSLog(@"主线程 >> %@",[NSThread currentThread]);
}

/*
 2018-05-06 17:39:27.719681+0800 xctest[5689:185283] 任务一 >> <NSThread: 0x7fe381757a30>{number = 2, name = (null)}
 2018-05-06 17:39:27.719682+0800 xctest[5689:185349] 任务二 >> <NSThread: 0x7fe38141c620>{number = 3, name = (null)}
 2018-05-06 17:39:27.719907+0800 xctest[5689:185208] barrier任务 >> <NSThread: 0x7fe3815061d0>{number = 1, name = main}
 2018-05-06 17:39:27.720027+0800 xctest[5689:185208] 主线程 >> <NSThread: 0x7fe3815061d0>{number = 1, name = main}
 2018-05-06 17:39:27.720062+0800 xctest[5689:185283] 任务三 >> <NSThread: 0x7fe381757a30>{number = 2, name = (null)}
 
 dispatch_barrier_sync会阻塞主线程.
 */
- (void)testBarrierSync {
    // 不能使用global_queue.否则会不起效果.
    // dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    
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
        NSLog(@"任务三 >> %@",[NSThread currentThread]);
    });
    NSLog(@"主线程 >> %@",[NSThread currentThread]);
}
/*
 异步串行队列
 2018-05-06 17:55:15.818995+0800 xctest[5941:196444] <NSThread: 0x7ff1e9e414d0>{number = 2, name = (null)}
 */
- (void)testAsyc_serialQueue {
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

/*
 异步主队列
 2018-05-06 17:57:00.849587+0800 xctest[5991:198113] <NSThread: 0x7f8113505800>{number = 1, name = main}
 */
- (void)testAsyc_mianQueue {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

/*
 同步主队列
 ***!!!!!死锁!!!!*****
 
 主线程在等待sync执行完
 但sync却在主队列里排队.
 */
- (void)testSyc_mianQueue {
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

/*
 同步全局队列
 2018-05-06 18:00:56.570467+0800 xctest[6083:202285] <NSThread: 0x7fa388e0c8e0>{number = 1, name = main}
 */
- (void)testSyc_GlobalQueue {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
}

////////////////////////////////////////////dispatch_apply/////////////////////////////////////////////////////

/*
 2018-05-06 18:09:06.709262+0800 xctest[6213:208635] 2 >> <NSThread: 0x7fbac9764830>{number = 3, name = (null)}
 2018-05-06 18:09:06.709262+0800 xctest[6213:208641] 3 >> <NSThread: 0x7fbac967fea0>{number = 4, name = (null)}
 2018-05-06 18:09:06.709262+0800 xctest[6213:208553] 0 >> <NSThread: 0x7fbac9705f50>{number = 1, name = main}
 2018-05-06 18:09:06.709290+0800 xctest[6213:208647] 1 >> <NSThread: 0x7fbac9420680>{number = 2, name = (null)}
 2018-05-06 18:09:06.709490+0800 xctest[6213:208641] 4 >> <NSThread: 0x7fbac967fea0>{number = 4, name = (null)}
 2018-05-06 18:09:06.709520+0800 xctest[6213:208635] 5 >> <NSThread: 0x7fbac9764830>{number = 3, name = (null)}
 2018-05-06 18:09:06.709605+0800 xctest[6213:208553] 6 >> <NSThread: 0x7fbac9705f50>{number = 1, name = main}
 2018-05-06 18:09:06.709649+0800 xctest[6213:208647] 7 >> <NSThread: 0x7fbac9420680>{number = 2, name = (null)}
 2018-05-06 18:09:06.709845+0800 xctest[6213:208641] 8 >> <NSThread: 0x7fbac967fea0>{number = 4, name = (null)}
 2018-05-06 18:09:06.709974+0800 xctest[6213:208635] 9 >> <NSThread: 0x7fbac9764830>{number = 3, name = (null)}
 2018-05-06 18:09:06.710226+0800 xctest[6213:208553] done
 
 会阻塞当前线程
 */
- (void)testApply {
    
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"%ld >> %@",index,[NSThread currentThread]);
    });
    NSLog(@"done");
}

/*
 2018-05-06 18:11:49.986449+0800 xctest[6294:211545] done
 2018-05-06 18:11:49.986669+0800 xctest[6294:211632] 0 >> <NSThread: 0x7fe3ff65b480>{number = 2, name = (null)}
 2018-05-06 18:11:49.986684+0800 xctest[6294:211624] 2 >> <NSThread: 0x7fe3ff455b90>{number = 4, name = (null)}
 2018-05-06 18:11:49.986703+0800 xctest[6294:211630] 1 >> <NSThread: 0x7fe3ff455a90>{number = 3, name = (null)}
 2018-05-06 18:11:49.986894+0800 xctest[6294:211632] 4 >> <NSThread: 0x7fe3ff65b480>{number = 2, name = (null)}
 2018-05-06 18:11:49.986936+0800 xctest[6294:211624] 5 >> <NSThread: 0x7fe3ff455b90>{number = 4, name = (null)}
 2018-05-06 18:11:49.986991+0800 xctest[6294:211630] 6 >> <NSThread: 0x7fe3ff455a90>{number = 3, name = (null)}
 2018-05-06 18:11:49.986715+0800 xctest[6294:211623] 3 >> <NSThread: 0x7fe3ff455ee0>{number = 5, name = (null)}
 2018-05-06 18:11:49.987271+0800 xctest[6294:211632] 7 >> <NSThread: 0x7fe3ff65b480>{number = 2, name = (null)}
 2018-05-06 18:11:49.987374+0800 xctest[6294:211630] 9 >> <NSThread: 0x7fe3ff455a90>{number = 3, name = (null)}
 2018-05-06 18:11:49.987395+0800 xctest[6294:211624] 8 >> <NSThread: 0x7fe3ff455b90>{number = 4, name = (null)}
 2018-05-06 18:11:49.987753+0800 xctest[6294:211632] async done <NSThread: 0x7fe3ff65b480>{number = 2, name = (null)}
 2018-05-06 18:14:12.865926+0800 xctest[6365:214286] 回到主线程更新ui <NSThread: 0x7fc342c045a0>{number = 1, name = main}
 
 会阻塞当前线程
 */
- (void)testAsyncApply {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t index) {
            NSLog(@"%ld >> %@",index,[NSThread currentThread]);
        });
        NSLog(@"async done %@",[NSThread currentThread]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"回到主线程更新ui %@",[NSThread currentThread]);
        });
    });

    NSLog(@"done");
}

@end
