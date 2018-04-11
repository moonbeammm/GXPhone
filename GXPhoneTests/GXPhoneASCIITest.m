//
//  GXPhoneASCIITest.m
//  GXPhoneTests
//
//  Created by sgx on 2018/4/10.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneASCIITest : XCTestCase

@end

@implementation GXPhoneASCIITest

unsigned char HexToChar(unsigned char bChar)
{
    if((bChar>=0x30)&&(bChar<=0x39))
    {
        bChar -= 0x30;
    }
    else if((bChar>=0x41)&&(bChar<=0x46)) // Capital
    {
        bChar -= 0x37;
    }
    else if((bChar>=0x61)&&(bChar<=0x66)) //littlecase
    {
        bChar -= 0x57;
    }
    else
    {
        bChar = 0xff;
    }
    return bChar;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    char asc = HexToChar("cffa");
    NSLog(@"%s",asc);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
