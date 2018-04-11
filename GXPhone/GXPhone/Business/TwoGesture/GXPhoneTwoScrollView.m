//
//  GXPhoneTwoScrollView.m
//  GXPhone
//
//  Created by sgx on 2018/2/24.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneTwoScrollView.h"

@interface GXPhoneTwoScrollView () <UIGestureRecognizerDelegate>

@end

@implementation GXPhoneTwoScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
