//
//  NSString+DateStringConvert.m
//  GXModule
//
//  Created by sunguangxin on 16/10/14.
//  Copyright © 2016年 GX. All rights reserved.
//

#import "NSString+DateStringConvert.h"

@implementation NSString (DateStringConvert)

// @"2016-09-09 5:00:00"  --- >>>  9月9日5时
- (NSString *)dateStringConvertWithDateString:(NSString *)string
{
    // 创建dateFormatter. 设置格式.
    NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    // 用dateFormatter将string转化成date数据
    NSDate * date = [fmt dateFromString:string];
    
    // 改变dateFormmater的格式
    fmt.dateFormat = @"MM-dd HH";
    
    // 将date数据转化成我们想要的formmatter格式
    NSString * dateStr = [fmt stringFromDate:date];
    
    // 返回切割后拼接成我们想要的格式的字符串.
    return [self separatedStringByCharacters:@"- " separatedString:dateStr];
}

#pragma mark - Helper
- (NSString *)separatedStringByCharacters:(NSString *)characters separatedString:(NSString *)separatedString
{
    NSArray *array = [separatedString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:characters]];
    NSMutableArray * separatedArray = [[NSMutableArray alloc] init];
    for (NSString * tmp in array) {
        NSString * string = tmp;
        if (string.length == 2 && [string integerValue] < 10) {
            string = [string substringFromIndex:1];
        }
        if (string.length > 0) {
            [separatedArray addObject:string];
        }
    }
    NSString * dateString;
    if (separatedArray.count == 3) {
        dateString= [NSString stringWithFormat:@"%@月%@日%@时",separatedArray[0],separatedArray[1],separatedArray[2]];
    }
    return dateString;
}

@end
