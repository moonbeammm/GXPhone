//
//  GXSizePCH.h
//  GXPhone
//
//  Created by sunguangxin on 2017/3/2.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#ifndef GXSizePCH_h
#define GXSizePCH_h

#define kGXPHONE_TAB_BAR_HEIGHT 49
#define kGXPHONE_STATUS_BAR_HEIGHT 20


#define GX_SCREEN_WIDTH MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define GX_SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)

#endif /* GXSizePCH_h */
