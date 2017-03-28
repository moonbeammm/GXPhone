//
//  GXColorPCH.h
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#ifndef GXColorPCH_h
#define GXColorPCH_h


//arc4random_uniform(x) ----->>>>  0～(x-1)范围内的随机数
#define GXRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/**tabbar,*/
#define GXWhiteColor [UIColor whiteColor]
#define GXPinkColor HEXCOLOR(0xfb7299)

#endif /* GXColorPCH_h */
