//
//  GXPhoneRuntimeTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/17.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>

@interface GXPhoneRuntimeTest : XCTestCase
{
    NSString *_yangting;
}

@property (nonatomic, strong) NSString *sunguangxin;

@end

@implementation GXPhoneRuntimeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    /// 交换两个方法
    Method m1 = class_getInstanceMethod([self class], @selector(swizzling_testExample));
    Method m2 = class_getInstanceMethod([self class], @selector(testExample));
    method_exchangeImplementations(m1, m2);
}

- (void)swizzling_testExample {
    NSLog(@"我是被交换后的testExample方法!");
    [self swizzling_testExample];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"我是原本的testExample方法!");
}

/// class_copyPropertyList
/// 获取某类的所有属性
- (void)testCopyPropertyList {
    unsigned int propertyCount;
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    NSMutableDictionary *propertyDic = [NSMutableDictionary dictionaryWithCapacity:propertyCount];
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t property = propertys[i];
        const char * propertyNameTemp = property_getName(property);
        NSString * propertyName = [NSString stringWithCString:propertyNameTemp encoding:NSUTF8StringEncoding];
        id propertyValue = [self valueForKey:propertyName];
        [propertyDic setValue:propertyValue?:@"" forKey:propertyName];
    }
    free(propertys);
    NSLog(@"%@",propertyDic);
}

/// class_copyIvarList
/// 获取某类的所有成员变量
- (void)testCopyIvarList {
    unsigned int ivarCount;
    Ivar *ivars = class_copyIvarList([self class], &ivarCount);
    NSMutableDictionary *ivarDic = [NSMutableDictionary dictionaryWithCapacity:ivarCount];
    for (int i = 0; i < ivarCount; i++) {
        Ivar ivar = ivars[i];
        const char * ivarNameTemp = ivar_getName(ivar);
        NSString * ivarName = [NSString stringWithCString:ivarNameTemp encoding:NSUTF8StringEncoding];
        id ivarValue = [self valueForKey:ivarName];
        [ivarDic setValue:ivarValue?:@"" forKey:ivarName];
    }
    free(ivars);
    NSLog(@"%@",ivarDic);
}

/// objc_setAssociatedObject
/// objc_getAssociatedObject
/// 动态添加属性
const void *AssociateKey = "AssociateKey";
- (void)testAssociateObject {
    NSString *country = @"动态添加的属性!";
    objc_setAssociatedObject(self, AssociateKey, country, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSString * associateAttribute = objc_getAssociatedObject(self, AssociateKey);
    NSLog(@"动态添加的属性 >> %@",associateAttribute);
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

/// 测试调用一个不存在的方法的处理流程.
- (void)testUnrecognizedSelector {
    [self performSelector:@selector(noThisSelector)];
}

/// 调用的是实例方法就会调用这个.
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod(self, sel, (IMP)autoMethod, "v@:@");
    return YES;
}

void autoMethod(id self,SEL _cmd) {
    NSLog(@"\n self >>%@ \n SEL >> %@ \n",self,NSStringFromSelector(_cmd));
}

/// 调用的是类方法就会调用这个.与上面方法互斥.
+ (BOOL)resolveClassMethod:(SEL)sel {
    return [super resolveClassMethod:sel];
}

/// 前面方法没解决就会掉此方法.
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [super forwardingTargetForSelector:aSelector];
}

/// 这个方法没被调用.不知道为什么.??????
/// ???????????
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [super forwardInvocation:anInvocation];
}

@end
