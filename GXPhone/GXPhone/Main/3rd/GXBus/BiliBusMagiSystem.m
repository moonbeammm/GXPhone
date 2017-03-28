//
//  BiliBusMagiSystem.m
//  BiliCore
//
//  Created by 席浩洋 on 16/6/23.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "BiliBusMagiSystem.h"
#import "BiliBusModel.h"
#import "BiliBusValidator.h"

#define AsyncFunctionReturn(RESULT) if (resultBlock) { resultBlock(RESULT); } return

@interface BiliBusMagiSystem () {
    BOOL _lock;
    NSMutableDictionary *_subBusDict;
}

@end

@implementation BiliBusMagiSystem

+ (instancetype)sharedMagiSystem
{
    static BiliBusMagiSystem* magiSystem = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        magiSystem = [BiliBusMagiSystem new];
    });

    return magiSystem;
}

- (instancetype)init
{
    if (self = [super init]) {
        _subBusDict = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - Register
- (void)registerSubBus:(BiliBus *)subBus {
    if (_lock) {
        NSAssert(NO, @"BiliBusMagiSystem: 总线控制中枢已被锁定");
        return;
    }
    if (!(subBus && [subBus isKindOfClass:[BiliBus class]] && [subBus.name length] > 0)) {
        NSAssert(NO, @"BiliBusMagiSystem: 无效的子总线");
        return;
    }
    if ([_subBusDict.allKeys containsObject:subBus.name]) {
        NSAssert(NO, @"BiliBusMagiSystem: 已经存在的子总线");
        return;
    }
    _lock = YES;
    [subBus willBeRegistered];
    [_subBusDict setObject:subBus forKey:subBus.name];
    [subBus didBeenRegistered];
    _lock = NO;
}

+ (void)registerSubBus:(BiliBus *)subBus {
    [[BiliBusMagiSystem sharedMagiSystem] registerSubBus:subBus];
}

- (void)lock {
    _lock = YES;
}

+ (void)lock {
    [[BiliBusMagiSystem sharedMagiSystem] lock];
}

#pragma mark - CallFunction
- (BiliBus *)subBusForFunction:(NSString *)function {
    if (!(function && [function isKindOfClass:[NSString class]] && [function length] > 0)) {
        NSAssert(NO, @"BiliBusMagiSystem: 无效的总线方法名");
        return nil;
    }
    NSRange range = [function rangeOfString:@"/"];
    if (range.location == NSNotFound || range.location == 0) {
        NSAssert(NO, @"BiliBusMagiSystem: 无法检测到子总线名");
        return nil;
    }
    NSString *subBusName = [function substringWithRange:NSMakeRange(0, range.location)];
    if (![_subBusDict.allKeys containsObject:subBusName]) {
        return nil;
    }
    BiliBus *subBus = [_subBusDict objectForKey:subBusName];
    if (!(subBus && [subBus isKindOfClass:[BiliBus class]] && [subBus.name isEqualToString:subBusName])) {
        NSAssert(NO, @"BiliBusMagiSystem: 对应子总线无效");
        return nil;
    }
    return subBus;
}

+ (BiliBusModel *)callFunction:(NSString *)function
                     withModel:(BiliBusModel *)model
                     validator:(BiliBusValidator *)validator {
    BiliBus *subBus = [[BiliBusMagiSystem sharedMagiSystem] subBusForFunction:function];
    if (!subBus) {
        return nil;
    }
    if (model && ![model isMemberOfClass:[BiliBusModel class]]) {
        NSAssert(NO, @"BiliBusMagiSystem: 无效的输入模型");
        return nil;
    }
    if (validator && ![validator isMemberOfClass:[BiliBusValidator class]]) {
        NSAssert(NO, @"BiliBusMagiSystem: 无效的验证器");
        return nil;
    }
    BiliBusModel *result = [subBus callFunction:function withModel:model];
    if (validator && ![validator validateModel:result]) {
        NSAssert(NO, @"BiliBusMagiSystem: 验证失败");
        return nil;
    }
    return result;
}

+ (void)callAsyncFunction:(NSString *)function
                withModel:(BiliBusModel *)model
                validator:(BiliBusValidator *)validator
              resultBlock:(BiliBusResultBlock)resultBlock {
    BiliBus *subBus = [[BiliBusMagiSystem sharedMagiSystem] subBusForFunction:function];
    if (!subBus) {
        AsyncFunctionReturn(nil);
    }
    if (model && ![model isMemberOfClass:[BiliBusModel class]]) {
        NSAssert(NO, @"BiliBusMagiSystem: 无效的输入模型");
        AsyncFunctionReturn(nil);
    }
    if (validator && ![validator isMemberOfClass:[BiliBusValidator class]]) {
        NSAssert(NO, @"BiliBusMagiSystem: 无效的验证器");
        AsyncFunctionReturn(nil);
    }
    [subBus callAsyncFunction:function withModel:model resultBlock:^(BiliBusModel *result) {
        if (validator && ![validator validateModel:result]) {
            NSAssert(NO, @"BiliBusMagiSystem: 验证失败");
            AsyncFunctionReturn(nil);
        }
        AsyncFunctionReturn(result);
    }];
}

@end
