//
//  GXPhoneADelegateVC.h
//  GXPhone
//
//  Created by sunguangxin on 2017/6/5.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

/** 
 * 该类主要用于测试Avc调用Bvc的代理方法
 * 如: Bvc遵守了协议.并且实现了他.但是这个方法是在.m内部实现的.并没有暴露在.h文件里
 *    Avc拥有Bvc实例.
 * 那么: Avc就可以通过Bvc这个实例直接调用Bvc实现的代理方法.
 *
 * 前提是Bvc必须在.h里遵守协议.
 */

#import "GXPhoneBaseVC.h"

@interface GXPhoneADelegateVC : GXPhoneBaseVC

@end
