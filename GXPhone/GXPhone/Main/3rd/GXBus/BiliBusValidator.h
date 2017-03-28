//
//  BiliBusValidator.h
//  BiliBase
//
//  Created by 席浩洋 on 16/6/22.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BiliBusModel;

/**
 *  总线数据的验证器，用来验证总线数据模型是否合法
 *  仅仅需要添加对必选参数的验证
 */
@interface BiliBusValidator : NSObject

/**
 *  增加一个验证用来验证对应主键的值是Long型
 *
 *  @param key 对应主键
 */
- (void)setLongValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是Double型
 *
 *  @param key 对应主键
 */
- (void)setDoubleValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是String型
 *
 *  @param key 对应主键
 */
- (void)setStringValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是总线数据模型
 *
 *  @param key 对应主键
 */
- (void)setModelValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是Long型数据
 *
 *  @param key 对应主键
 */
- (void)setLongArrayValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是Double型数组
 *
 *  @param key 对应主键
 */
- (void)setDoubleArrayValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是String型数组
 *
 *  @param key 对应主键
 */
- (void)setStringArrayValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是总线数据模型数组
 *
 *  @param key 对应主键
 */
- (void)setModelArrayValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是VC
 *
 *  @param key 对应主键
 */
- (void)setControllerValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是View
 *
 *  @param key 对应主键
 */
- (void)setViewValidationForKey:(NSString *)key;

/**
 *  增加一个验证用来验证对应主键的值是ViewModel
 *
 *  @param key 对应主键
 */
- (void)setViewModelValidationForKey:(NSString *)key;

/**
 *  验证总线数据模型合法性
 *
 *  @param model 需要验证的总线数据模型
 *
 *  @return 总线数据模型是否合法
 */
- (BOOL)validateModel:(BiliBusModel *)model;

@end
