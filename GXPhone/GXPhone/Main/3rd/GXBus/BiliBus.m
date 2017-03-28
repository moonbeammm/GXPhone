//
//  BiliBus.m
//  BiliBase
//
//  Created by 席浩洋 on 16/6/22.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "BiliBus.h"
#import "BiliBusModel.h"
#import "BiliBusValidator.h"

@interface BiliBus () {
    NSString *_name;
}

@end

@implementation BiliBus

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

+ (instancetype)busWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}

#pragma mark - Property
- (NSString *)name
{
    return _name;
}

#pragma mark - Register
- (void)willBeRegistered {
    // override me
}

- (void)didBeenRegistered {
	// override me
}

#pragma mark - CallFunction
- (BiliBusModel *)callFunction:(NSString *)function
                     withModel:(BiliBusModel *)model {
    return nil;
}

- (void)callAsyncFunction:(NSString *)function
                withModel:(BiliBusModel *)model
              resultBlock:(BiliBusResultBlock)resultBlock {
    if (resultBlock) {
        resultBlock(nil);
    }
}

@end
