//
//  GXPhoneNavigator.h
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXPhoneNavigator : NSObject

+ (GXPhoneNavigator *)shared;

@property(nonatomic,readwrite,weak) UINavigationController *navigationController;

- (void)showCAAnimationVC;

@end
