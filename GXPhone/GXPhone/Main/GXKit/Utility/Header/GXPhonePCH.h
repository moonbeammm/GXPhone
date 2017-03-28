//
//  GXPhonePCH.h
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#ifndef GXPhonePCH_h
#define GXPhonePCH_h


#if DEBUG
//#define NSLog(fmt, ...) NSLog((@"\n***************start*****************\n%s line:%d\n thread:%@\n***************end*****************\n" fmt), __PRETTY_FUNCTION__, __LINE__, [NSThread currentThread], ##__VA_ARGS__);
#define NSLog(fmt, ...) NSLog((@"%s line:%d\n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...)
#endif

/**专门打印vc的声明周期*/
#if 1
#define GXLog(fmt, ...) NSLog(@"%@",NSStringFromSelector(_cmd));
#else
#define GXLog(...)
#endif


#define kDocumentDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#endif /* GXPhonePCH_h */
