//
//  GXPhoneSubStrTest.m
//  GXPhone
//
//  Created by sunguangxin on 2017/8/31.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneSubStrTest : XCTestCase

@end

@implementation GXPhoneSubStrTest

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
    NSString *str = @"";
    NSString *terminalStr = @"";
    
    str = @"我会发光";
    terminalStr = [[self class] subStringToMaxIndex:10 originStr:str hasSuffix:YES];
    NSAssert([terminalStr isEqualToString:str], @"截取错误!str1:%@,termialStr:%@",str,terminalStr);

    str = @"我会发光哦";
    terminalStr = [[self class] subStringToMaxIndex:10 originStr:str hasSuffix:YES];
    NSAssert([terminalStr isEqualToString:str], @"截取错误!str1:%@,termialStr:%@",str,terminalStr);
    
    str = @"我会发光哦哈";
    terminalStr = [[self class] subStringToMaxIndex:10 originStr:str hasSuffix:YES];
    NSAssert([terminalStr isEqualToString:@"我会发光..."], @"截取错误!str1:%@,termialStr:%@",str,terminalStr);
    
    str = @"abcdefghi";
    terminalStr = [[self class] subStringToMaxIndex:10 originStr:str hasSuffix:YES];
    NSAssert([terminalStr isEqualToString:str], @"截取错误!str1:%@,termialStr:%@",str,terminalStr);
    
    str = @"abcdefghij";
    terminalStr = [[self class] subStringToMaxIndex:10 originStr:str hasSuffix:YES];
    NSAssert([terminalStr isEqualToString:str], @"截取错误!str1:%@,termialStr:%@",str,terminalStr);
    
    str = @"abcdefghijk";
    terminalStr = [[self class] subStringToMaxIndex:10 originStr:str hasSuffix:YES];
    NSAssert([terminalStr isEqualToString:@"abcdefgh..."], @"截取错误!str1:%@,termialStr:%@",str,terminalStr);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

+ (NSString *)subStringToMaxIndex:(NSUInteger)maxIndex originStr:(NSString *)originStr
{
    return [[self class] subStringToMaxIndex:maxIndex originStr:originStr hasSuffix:NO];
}

+ (NSString *)subStringToMaxIndex:(NSUInteger)maxIndex originStr:(NSString *)originStr hasSuffix:(BOOL)hasSuffix
{    
    BOOL isOutOfMaxIndex = NO;
    NSUInteger strLength = [originStr length];
    NSUInteger currentLength = 0;
    NSUInteger index = 0;
    NSUInteger addSuffixIndex = 0;
    
    for (; index < strLength; index++) {
        unichar indexChar = [originStr characterAtIndex:index];
        if (isblank(indexChar)) {
            currentLength++;
        } else if (isascii(indexChar)) {
            currentLength++;
        } else {
            currentLength+=2;
        }
        
        if (hasSuffix) { // 只有需要加省略号的时候才做如下判断
            if ((currentLength >= (maxIndex - 2)) && (addSuffixIndex == 0)) {
                // 记录下超出maxIndex之前的一个index.只记录一次.
                addSuffixIndex = index;
            }
            if ((currentLength >= maxIndex) && (strLength > (index + 1))) {
                // 判断该字符串有没有超出MaxIndex
                isOutOfMaxIndex = YES;
            }
        }
        
        if (currentLength >= maxIndex) {
            break;
        }
    }
    NSString *terminalStr = @"";
    if (!hasSuffix || !isOutOfMaxIndex) {
        terminalStr = [originStr substringWithRange:NSMakeRange(0, MIN(index + 1, strLength))];
    } else {
        NSString * terminalStrTemp = [originStr substringWithRange:NSMakeRange(0, MIN(addSuffixIndex + 1, strLength))];
        terminalStr = [NSString stringWithFormat:@"%@...",terminalStrTemp];
    }
    return terminalStr;
}

@end
