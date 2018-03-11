//
//  GXPhoneAsyncBlockTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/12.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneAsyncBlockTest : XCTestCase

@end

@implementation GXPhoneAsyncBlockTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 研究: 异步执行block.那这个block会在什么时候被执行.
*/
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    void (^testBlock)(void) = ^(){
        NSLog(@"2 >>>>>>>> async exxcute block!");
    };
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            testBlock();
        });
        NSLog(@"1 >>>>>>>> main thread!");
    }


    /** 执行结果: 先后顺序不确定.
     2018-03-12 00:49:55.648321+0800 xctest[15787:1172603] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.648230+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.648467+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.648484+0800 xctest[15787:1172603] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.649437+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.649661+0800 xctest[15787:1172603] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.650929+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.650968+0800 xctest[15787:1172603] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.651357+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.651421+0800 xctest[15787:1172603] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.651722+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.651781+0800 xctest[15787:1172603] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.651949+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.651973+0800 xctest[15787:1172608] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.652116+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.652127+0800 xctest[15787:1172603] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.652916+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.652935+0800 xctest[15787:1172608] 2 >>>>>>>> async exxcute block!
     2018-03-12 00:49:55.658496+0800 xctest[15787:1172532] 1 >>>>>>>> main thread!
     2018-03-12 00:49:55.659845+0800 xctest[15787:1172608] 2 >>>>>>>> async exxcute block!
     */
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
