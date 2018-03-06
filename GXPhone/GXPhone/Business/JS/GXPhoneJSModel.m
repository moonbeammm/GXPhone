//
//  GXPhoneJSModel.m
//  GXPhone
//
//  Created by sgx on 2018/3/6.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneJSModel.h"
@import JavaScriptCore;

@implementation GXPhoneJSModel

+ (JSContext *)sharedJavaScriptContext {
    static JSContext *sharedContext;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedContext = [[JSContext alloc] init];
        NSBundle *bundle = [NSBundle bundleForClass:self];
        NSString *parserPath = [bundle pathForResource:@"dynamic" ofType:@"js"];
        NSString *parserSource = [[NSString alloc] initWithContentsOfFile:parserPath encoding:NSUTF8StringEncoding error:NULL];
        [sharedContext evaluateScript:parserSource];
    });
    return sharedContext;
}

+ (id)parseByJavaScriptWithRawContent:(NSString *)rawContent {
    NSString *escapedContent = [rawContent stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
    escapedContent = [escapedContent stringByReplacingOccurrencesOfString:@"`" withString:@"\\`"];
    JSContext *context = [GXPhoneJSModel sharedJavaScriptContext];
    
    // 调用JS的方法
    JSValue *value = [context evaluateScript:@"ClickHandler('SB')"];
//    // 调用JS的block
//    JSValue *value1 = [context[@"appendString"] callWithArguments:@[@"hello"]];
//    // 调用JS的变量
//    JSValue *value2 = context[@"arr"];
//    NSLog(@"value: >> %@ value1: >> %@ value2: >> %@",value,value1,value2);
    return [value toObject];
}

@end
