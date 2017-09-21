//
//  GXPhoneRACDisposerShare.h
//  GXPhone
//
//  Created by sunguangxin on 2017/9/11.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXPhoneRACDisposerShare : NSObject
@property (nonatomic, strong) NSString *name;

+ (GXPhoneRACDisposerShare *)shared;
@end
