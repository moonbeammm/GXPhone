//
//  BiliBusValidator.m
//  BiliBase
//
//  Created by 席浩洋 on 16/6/22.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "BiliBusValidator.h"
#import "BiliBusModel.h"

@interface BiliBusValidator () {
    NSMutableDictionary *_valueTypesDict; // 存储需要验证的值类型字典
}

@end

@implementation BiliBusValidator

- (instancetype)init
{
    if (self = [super init]) {
        _valueTypesDict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setLongValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"l" forKey:key];
}

- (void)setDoubleValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"d" forKey:key];
}

- (void)setStringArrayValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"sa" forKey:key];
}

- (void)setModelValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"m" forKey:key];
}

- (void)setLongArrayValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"la" forKey:key];
}

- (void)setDoubleArrayValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"da" forKey:key];
}

- (void)setStringValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"s" forKey:key];
}

- (void)setModelArrayValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"ma" forKey:key];
}

- (void)setControllerValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"c" forKey:key];
}

- (void)setViewValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"v" forKey:key];
}

- (void)setViewModelValidationForKey:(NSString *)key {
    [_valueTypesDict setObject:@"vm" forKey:key];
}

- (BOOL)validateModel:(BiliBusModel *)model {
    if (!(model && [model isMemberOfClass:[BiliBusModel class]] && model.valueTypeDict && model.valueTypeDict.count >= _valueTypesDict.count)) {
        return NO;
    }
    for (NSString *key in _valueTypesDict.allKeys) {
        NSString *type1 = [_valueTypesDict objectForKey:key];
        NSString *type2 = [model.valueTypeDict objectForKey:key];
        if (!(type1 && [type1 isKindOfClass:[NSString class]])) {
            NSAssert(NO, @"BiliBusValidator: 无效的验证类型");
            return NO;
        }
        if (!(type2 && [type2 isKindOfClass:[NSString class]])) {
            NSAssert(NO, @"BiliBusValidator: 无效的总线模型值类型");
            return NO;
        }
        if (![type1 isEqualToString:type2]) {
            NSAssert(NO, @"BiliBusValidator: 验证类型和总线模型值类型不匹配");
            return NO;
        }
    }
    return YES;
}

@end
