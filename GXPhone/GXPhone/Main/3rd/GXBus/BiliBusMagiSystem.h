//
//  BiliBusMagiSystem.h
//  BiliCore
//
//  Created by 席浩洋 on 16/6/23.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BiliBus.h"

/**
 *  总线控制中枢
 */
@interface BiliBusMagiSystem : NSObject

/**
 *  注册一个新的总线到总线控制中枢
 *
 *  @param subBus 子总线，需要设置正确的名字
 */
+ (void)registerSubBus:(BiliBus *)subBus;

/**
 *  锁定总线控制中枢，不再允许添加新的子总线
 */
+ (void)lock;

/**
 *  调用总线的同步方法并获得返回值
 *  以下情况会返回nil
 *  1. 没有找到有效的方法
 *  2. 找到方法但是调用不需要返回值
 *  3. 返回值的验证失败
 *
 *  @param function  要调用的方法名
 *  @param model     传入的总线数据模型，可以为空
 *  @param validator 需要对返回值进行的验证，可以为空
 *
 *  @return 返回一个总线数据模型
 */
+ (BiliBusModel *)callFunction:(NSString *)function
                     withModel:(BiliBusModel *)model
                     validator:(BiliBusValidator *)validator;

/**
 *  调用总线的异步方法并通过Block回调获得返回值
 *  返回nil的情况与同步方法描述一致
 *  请各业务方保证在resultBlock存在的情况下一定要进行且仅进行一次调用
 *
 *  @param function    要调用的方法名
 *  @param model       传入的总线数据模型，可以为空
 *  @param validator   需要对返回值进行的验证，可以为空
 *  @param resultBlock 传递返回值的回调Block
 */
+ (void)callAsyncFunction:(NSString *)function
                withModel:(BiliBusModel *)model
                validator:(BiliBusValidator *)validator
              resultBlock:(BiliBusResultBlock)resultBlock;

@end
