//
//  GXPhoneChild.m
//  GXPhone
//
//  Created by sunguangxin on 2018/3/17.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneChild.h"

@interface GXPhoneChild ()

@property (nonatomic, strong) NSString *otherStr;

@end

@implementation GXPhoneChild
@synthesize testName = _testName;
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setTestName:(NSString *)testName {
    _testName = @"sun";
    self.otherStr = @"hehe";
    
}

@end
