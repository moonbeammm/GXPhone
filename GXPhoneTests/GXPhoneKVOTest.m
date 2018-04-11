//
//  GXPhoneKVOTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/17.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>

@interface PersonHaha : NSObject

@end

@implementation PersonHaha

- (void)setName:(NSString *)name {
    
}

-(NSString *)name {
    return nil;
}

@end


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;

@end

@implementation Person
@dynamic name;

/// 只有此方法返回非空值.才会调用forwardInvocation方法
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *sig = [[PersonHaha new] methodSignatureForSelector:aSelector];
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    [anInvocation invokeWithTarget:[PersonHaha new]];
}

@end


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface GXPhoneKVOTest : XCTestCase

@property (nonatomic, strong) NSString *nameStr;
@property (nonatomic, strong) NSMutableArray *mutArr;

@end

@implementation GXPhoneKVOTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.nameStr = @"sun";
    self.mutArr = [NSMutableArray arrayWithArray:@[@"one"]];
    [self addObserver:self forKeyPath:@"nameStr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@""];
    [self addObserver:self forKeyPath:@"mutArr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@""];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    // 1.此处改变可以监听到.
    self.nameStr = @"sgx";
    // 2.这样修改是监听不到的.这样修改并没有调用mutArr这个属性的set方法.
    self.mutArr[0] = @"two";
}

// 3.就算重写了nameStr的set方法.KVO一样可以监听到.
// 因为KVO是创建了你监听的类的子类.然后将你监听的类的isa指向了这个子类.
// 在这个子类里重写了该属性的set方法.
// 你重写的这个set方法又会被子类覆盖掉.
// 所以一样能监听到.
- (void)setNameStr:(NSString *)nameStr {
    _nameStr = nameStr;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@对象的%@属性改变了：%@", object, keyPath, change);
}

// 4.有种情况KVO监听不到
// 如上的person类.监听了name属性.
// 但是name属性使用dynamic来修饰了.就不会产生set和get方法了
// 此时我们使用forwardInvocation来讲消息转发.防止崩溃
// 这时是触发不了KVO的.

@end
