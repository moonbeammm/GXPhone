//
//  GXPhoneStringSeparateTest.m
//  GXPhoneTests
//
//  Created by sgx on 2018/3/19.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneStringSeparateTest : XCTestCase

@end

@implementation GXPhoneStringSeparateTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *paramsString0 = @"?eid=333&name=/.,";
    NSString *paramsString1 = @"?eid=333&name==";
    NSString *paramsString2 = @"?eid=333&name===&eid=22";
    NSString *paramsString3 = @"?eid=333&name=\\jj&eid=22";//不支持
    NSString *paramsString4 = @"?eid=333&name=\.jj&eid=22";
    NSString *paramsString5 = @"?eid=333&name=\\\\jj&eid=22";// 不支持
    NSArray *paramsStringArr = @[paramsString0,paramsString1,paramsString2,paramsString3,paramsString4,paramsString5];
    
    for (NSString *paramsString in paramsStringArr) {
        /// 用正则提取name的值.
        /// 正则表达式全集: http://tool.oschina.net/uploads/apidocs/jquery/regexp.html
        NSArray *array = [self matchString:paramsString toRegexString:@"name=(.*?)(?:&|$)"];
        NSLog(@"%@",array);
    }

    
    for (NSString *paramsString in paramsStringArr) {
        /// 用系统类URLComponents来提取name的值.
        NSURLComponents *urlComponents = [NSURLComponents componentsWithString:paramsString];
        NSArray *arrs = urlComponents.queryItems;
        for (NSURLQueryItem *queryItem in arrs) {
            if ([queryItem.name isEqualToString:@"name"]) {
                NSLog(@"%@",queryItem.value);
            }
        }
    }
}

/**
 *  正则匹配返回符合要求的字符串 数组
 *
 *  @param string   需要匹配的字符串
 *  @param regexStr 正则表达式
 *
 *  @return 符合要求的字符串 数组 (按(),分级,正常0)
 */
- (NSArray *)matchString:(NSString *)string toRegexString:(NSString *)regexStr
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray * matches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    //match: 所有匹配到的字符,根据() 包含级
    NSMutableArray *array = [NSMutableArray array];
    for (NSTextCheckingResult *match in matches) {
        for (int i = 0; i < [match numberOfRanges]; i++) {
            //以正则中的(),划分成不同的匹配部分
            NSString *component = [string substringWithRange:[match rangeAtIndex:i]];
            [array addObject:component];
        }
    }
    return array;
}

@end
