//
//  GXPhoneDictionaryKeyTest.m
//  GXPhoneTests
//
//  Created by sgx on 2018/3/30.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneTestKey : NSObject <NSCopying>

@end

@implementation GXPhoneTestKey

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end

@interface GXPhoneDictionaryKeyTest : XCTestCase

@end

@implementation GXPhoneDictionaryKeyTest

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    GXPhoneTestKey *key = [GXPhoneTestKey new];
    NSDictionary *dict = @{key:@"aa"};
    NSLog(@"%@",dict[key]);
    
    /*
     2018-03-30 12:19:03.167350+0800 xctest[3501:88818] aa
     */
    
    NSDictionary *dictOne = @{@"aa":@"bb"};
    NSLog(@"%p",dictOne);
    NSDictionary *dictTwo = [dictOne copy];
    NSLog(@"%p",dictTwo);
    
    /*
     2018-03-30 14:16:42.822448+0800 xctest[3501:88818] 0x7fbb3ee3a610
     2018-03-30 14:16:46.024883+0800 xctest[3501:88818] 0x7fbb3ee3a610
     */
    /*
     如果想作为dict的key.
     就必须实现NSCopying协议.并实现-copyWithZone方法
     */
    /*
     浅拷贝就直接返回自己.
     深拷贝就创建一个新的.然后把self的值赋给他.
     */
}

@end
