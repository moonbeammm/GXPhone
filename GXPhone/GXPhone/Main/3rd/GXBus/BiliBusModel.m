//
//  BiliBusModel.m
//  BiliBase
//
//  Created by 席浩洋 on 16/6/22.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "BiliBusModel.h"
#import "BiliBusValidator.h"

@interface BiliBusModel () {
    NSDictionary *_valueTypeDict; // 用于暴露给外部使用，不可变的值类型字典
    NSMutableDictionary *_mutableValueTypeDict; // 内部动态添加值类型的字典
    NSDictionary *_valueDict; // 内部存储值的字典
}

@end

@implementation BiliBusModel

- (instancetype)init
{
    if (self = [super init]) {
        _mutableValueTypeDict = [NSMutableDictionary dictionary];
        _valueDict = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - Property & Helper
- (NSDictionary *)valueTypeDict
{
    if (!_valueTypeDict) {
        _valueTypeDict = [_mutableValueTypeDict copy];
    }
    return _valueTypeDict;
}

- (void)setValueType:(NSString *)type forKey:(NSString *)key {
    _valueTypeDict = nil;
    [_mutableValueTypeDict setObject:type forKey:key];
}

#pragma mark - Public Helper
- (BOOL)hasValueForKey:(NSString *)key
{
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (type && [type isKindOfClass:[NSString class]]) {
        return YES;
    }
    return NO;
}

#pragma mark - Setter
- (void)setLongValue:(int64_t)value forKey:(NSString *)key {
    [_valueDict setValue:[NSNumber numberWithLongLong:value] forKey:key];
    [self setValueType:@"l" forKey:key];
}

- (void)setDoubleValue:(double)value forKey:(NSString *)key {
    [_valueDict setValue:[NSNumber numberWithDouble:value] forKey:key];
    [self setValueType:@"d" forKey:key];
}

- (void)setStringValue:(NSString *)value forKey:(NSString *)key {
    if (!(value && [value isKindOfClass:[NSString class]])) {
        NSAssert(NO, @"BiliBusModel: 无效的字串类型");
        return;
    }
    [_valueDict setValue:[value copy] forKey:key];
    [self setValueType:@"s" forKey:key];
}

- (void)setModelValue:(BiliBusModel *)value forKey:(NSString *)key {
    if (!(value && [value isMemberOfClass:[BiliBusModel class]])) {
        NSAssert(NO, @"BiliBusModel: 无效的子总线模型");
        return;
    }
    [_valueDict setValue:value forKey:key];
    [self setValueType:@"m" forKey:key];
}

- (void)setLongArrayValue:(NSArray *)value forKey:(NSString *)key {
    if (!(value && [value isKindOfClass:[NSArray class]])) {
        NSAssert(NO, @"BiliBusModel: 无效的数组类型");
        return;
    }
    for (id object in value) {
        if (![object isKindOfClass:[NSNumber class]]) {
            NSAssert(NO, @"BiliBusModel: 数组内包含非数字类型");
            return;
        }
    }
    [_valueDict setValue:[value copy] forKey:key];
    [self setValueType:@"la" forKey:key];
}

- (void)setDoubleArrayValue:(NSArray *)value forKey:(NSString *)key {
    if (!(value && [value isKindOfClass:[NSArray class]])) {
        NSAssert(NO, @"BiliBusModel: 无效的数组类型");
        return;
    }
    for (id object in value) {
        if (![object isKindOfClass:[NSNumber class]]) {
            NSAssert(NO, @"BiliBusModel: 数组内包含非数字类型");
            return;
        }
    }
    [_valueDict setValue:[value copy] forKey:key];
    [self setValueType:@"da" forKey:key];
}

- (void)setStringArrayValue:(NSArray *)value forKey:(NSString *)key {
    if (!(value && [value isKindOfClass:[NSArray class]])) {
        NSAssert(NO, @"BiliBusModel: 无效的数组类型");
        return;
    }
    for (id object in value) {
        if (![object isKindOfClass:[NSString class]]) {
            NSAssert(NO, @"BiliBusModel: 数组内包含非字串类型");
            return;
        }
    }
    [_valueDict setValue:[value copy] forKey:key];
    [self setValueType:@"sa" forKey:key];
}

- (void)setModelArrayValue:(NSArray *)value forKey:(NSString *)key {
    if (!(value && [value isKindOfClass:[NSArray class]])) {
        NSAssert(NO, @"BiliBusModel: 无效的数组类型");
        return;
    }
    for (id object in value) {
        if (![object isMemberOfClass:[BiliBusModel class]]) {
            NSAssert(NO, @"BiliBusModel: 数组内包含非总线模型");
            return;
        }
    }
    [_valueDict setValue:[value copy] forKey:key];
    [self setValueType:@"ma" forKey:key];
}

- (void)setControllerValue:(UIViewController *)value forKey:(NSString *)key {
    if (!(value && [value isKindOfClass:[UIViewController class]])) {
        NSAssert(NO, @"BiliBusModel: 无效的VC类型");
        return;
    }
    [_valueDict setValue:value forKey:key];
    [self setValueType:@"c" forKey:key];
}

- (void)setViewValue:(UIView *)value forKey:(NSString *)key {
    if (!(value && [value isKindOfClass:[UIView class]])) {
        NSAssert(NO, @"BiliBusModel: 无效的View类型");
        return;
    }
    [_valueDict setValue:value forKey:key];
    [self setValueType:@"v" forKey:key];
}

- (void)setViewModelValue:(id)value forKey:(NSString *)key {
    if (!(value && ([value isKindOfClass:NSClassFromString(@"BBPhoneBaseVM")] || [value isKindOfClass:NSClassFromString(@"BBPadBaseVM")]))) {
        NSAssert(NO, @"BiliBusModel: 无效的ViewModel类型");
        return;
    }
    [_valueDict setValue:value forKey:key];
    [self setValueType:@"vm" forKey:key];
}

#pragma mark - Getter
- (int64_t)longValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"l"])) {
        return 0;
    }
    NSNumber *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[NSNumber class]])) {
        return 0;
    }
    return [value longLongValue];
}

- (double)doubleValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"d"])) {
        return 0;
    }
    NSNumber *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[NSNumber class]])) {
        return 0;
    }
    return [value doubleValue];
}

- (NSString *)stringValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"s"])) {
        return nil;
    }
    NSString *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[NSString class]])) {
        return nil;
    }
    return value;
}

- (BiliBusModel *)modelValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"m"])) {
        return nil;
    }
    BiliBusModel *value = [_valueDict objectForKey:key];
    if (!(value && [value isMemberOfClass:[BiliBusModel class]])) {
        return nil;
    }
    return value;
}

- (NSArray *)longArrayValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"la"])) {
        return nil;
    }
    NSArray *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[NSArray class]])) {
        return nil;
    }
    return value;
}

- (NSArray *)doubleArrayValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"da"])) {
        return nil;
    }
    NSArray *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[NSArray class]])) {
        return nil;
    }
    return value;
}

- (NSArray *)stringArrayValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"sa"])) {
        return nil;
    }
    NSArray *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[NSArray class]])) {
        return nil;
    }
    return value;
}

- (NSArray *)modelArrayValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"ma"])) {
        return nil;
    }
    NSArray *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[NSArray class]])) {
        return nil;
    }
    return value;
}

- (UIViewController *)controllerValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"c"])) {
        return nil;
    }
    UIViewController *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[UIViewController class]])) {
        return nil;
    }
    return value;
}

- (UIView *)viewValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"v"])) {
        return nil;
    }
    UIView *value = [_valueDict objectForKey:key];
    if (!(value && [value isKindOfClass:[UIView class]])) {
        return nil;
    }
    return value;
}

- (id)viewModelValueForKey:(NSString *)key {
    NSString *type = [_mutableValueTypeDict valueForKey:key];
    if (!(type && [type isKindOfClass:[NSString class]] && [type isEqualToString:@"vm"])) {
        return nil;
    }
    UIView *value = [_valueDict objectForKey:key];
    if (!(value && ([value isKindOfClass:NSClassFromString(@"BBPhoneBaseVM")] || [value isKindOfClass:NSClassFromString(@"BBPadBaseVM")]))) {
        return nil;
    }
    return value;
}

@end
