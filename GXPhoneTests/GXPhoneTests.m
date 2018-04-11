//
//  GXPhoneTests.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2017/8/10.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneTests : XCTestCase

@end

@implementation GXPhoneTests

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
    CGFloat maxWidth = 200;
    NSString *str1 = @"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    NSString *str2 = @"水电费老司机斐林试剂冯老师觉得分类世纪东方老实交代斐林试剂代理费快结束了";
    NSString *str3 = @"xxxxxxxxxxx";
    NSString *str4 = @"是大佬烦死了都放假了圣诞节福利司法局";
    NSString *str5 = @"sdlkfsldfjls是大佬番剧熟练度附近胜利大街发牢骚的减肥了圣诞节福利";
    NSString *str6 = @"是大佬番剧熟练度附近胜利大街发牢骚的减肥了圣诞节福利sdlkfsldfjls";
    NSString *str7 = @"ssdlfjsldfjlsjdflsjdlfjsldfjslsldjf是两地分居熟练度附近说了房间";
    NSString *str8 = @"是两地分居熟练度附近说了房间ssdlfjsldfjlsjdflsjdlfjsldfjslsldjf";
    NSArray *arr = @[str1,str2,str3,str4,str5,str6,str7,str8];
    for (NSInteger i = 0; i<arr.count; i++) {
        
        NSLog(@"str%zd:%@",i,[self configString:arr[i] maxWidth:maxWidth increase:15]);
        NSLog(@"%@",arr[i]);
    }
}

- (NSString *)configString:(NSString *)string maxWidth:(CGFloat)maxWidth increase:(NSInteger)increase {
    CGFloat stringWidth = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
    if (stringWidth > maxWidth && string.length > 5) {
        if ((stringWidth - maxWidth) < 50) {
            NSLog(@"😁精确");
            NSString *tempStr = [string substringToIndex:string.length - 1];
            return [self configString:tempStr maxWidth:maxWidth increase:0];
        } else {
            NSLog(@"😁平均值");
            CGFloat averageCharacterWidht = stringWidth/string.length;
            NSInteger maxCharacterCount = maxWidth/averageCharacterWidht;
            maxCharacterCount = MIN(maxCharacterCount+increase, string.length);
            NSString *resultStr = [string substringToIndex:maxCharacterCount];
            return [self configString:resultStr maxWidth:maxWidth increase:0];
        }
    } else {
        NSLog(@"%lf",stringWidth);
        return string;
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
