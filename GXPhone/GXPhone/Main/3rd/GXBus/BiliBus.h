//
//  BiliBus.h
//  BiliBase
//
//  Created by 席浩洋 on 16/6/22.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BiliBusModel;
@class BiliBusValidator;

/**
 *  调用总线异步方法的回调Block
 *
 *  @param result 用于异步返回总线调用结果
 */
typedef void(^BiliBusResultBlock)(BiliBusModel *result);

@interface BiliBus : NSObject

@property (nonatomic, strong, readonly) NSString *name; // 总线名

- (instancetype)initWithName:(NSString *)name; // 初始化方法
+ (instancetype)busWithName:(NSString *)name; // 静态辅助初始化方法

/**
 *  即将被注册到总线控制中枢时收到的通知
 *  默认无任何行为，用来重载后做准备工作
 */
- (void)willBeRegistered;

/**
 *  已经成功被注册到总线控制中枢时收到的通知
 *  默认无任何行为，用来确认被成功注册
 */
- (void)didBeenRegistered;

/**
 *  调用总线的同步方法并获得返回值
 *  以下情况会返回nil
 *  1. 没有找到有效的方法
 *  2. 找到方法但是调用不需要返回值
 *  3. 返回值的验证失败
 *
 *  @param function  要调用的方法名
 *  @param model     传入的总线数据模型，可以为空
 *
 *  @return 返回一个总线数据模型
 */
- (BiliBusModel *)callFunction:(NSString *)function
                     withModel:(BiliBusModel *)model;

/**
 *  调用总线的异步方法并通过Block回调获得返回值
 *  返回nil的情况与同步方法描述一致
 *
 *  @param function    要调用的方法名
 *  @param model       传入的总线数据模型，可以为空
 *  @param resultBlock 传递返回值的回调Block
 */
- (void)callAsyncFunction:(NSString *)function
                withModel:(BiliBusModel *)model
              resultBlock:(BiliBusResultBlock)resultBlock;

@end
