//
//  GXPhoneDelegateResponseTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/19.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

struct {
    unsigned int didReceiveError;
    unsigned int didReceiveData;
} _delegateFlags;

@protocol GXPhoneDelegateResponseTestDelegate <NSObject>

@optional;
- (void)didReceiveData:(NSData *)data;
- (void)didReceiveError:(NSError *)error;

@end

@interface GXPhoneDelegateResponseTest : XCTestCase

@property (nonatomic, weak) id<GXPhoneDelegateResponseTestDelegate> delegate;

@end

@interface GXTest : NSObject <GXPhoneDelegateResponseTestDelegate>

@end

@implementation GXPhoneDelegateResponseTest

- (void)setDelegate:(id<GXPhoneDelegateResponseTestDelegate>)delegate {
    _delegate = delegate;
    _delegateFlags.didReceiveData = [delegate respondsToSelector:@selector(didReceiveData:)];
    _delegateFlags.didReceiveError = [delegate respondsToSelector:@selector(didReceiveError:)];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    GXTest *test = [GXTest new];
    self.delegate = test;
    if ([self.delegate respondsToSelector:@selector(didReceiveData:)]) {
        [self.delegate didReceiveData:nil];
    }
    
    /// 如果这个代理方法会频繁调用.就可以这样优化.
    if (_delegateFlags.didReceiveData) {
        [self.delegate didReceiveData:nil];
    }
}

@end



@implementation GXTest


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)didReceiveData:(NSData *)data {
    
}

@end
