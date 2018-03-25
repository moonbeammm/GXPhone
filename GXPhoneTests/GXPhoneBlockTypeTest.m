//
//  GXPhoneBlockTypeTest.m
//  GXPhoneTests
//
//  Created by sunguangxin on 2018/3/17.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GXPhoneBlockTypeTest : XCTestCase

@property (nonatomic, copy) void (^mallocBlock)(void);
@property (nonatomic, strong) NSArray *arrr;

@end

@implementation GXPhoneBlockTypeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

}

/// 1.globalBlock
/// 没有用到外界变量或只用到全局变量、静态变量的block为_NSConcreteGlobalBlock，生命周期从创建到应用程序结束。
- (void)testCreateGlobalTypeBlock {
    void (^globalBlock)(void) = ^{

    };
    NSLog(@"没有捕获外界变量.所以是__NSGlobalBlock__ >> %@",globalBlock);
    globalBlock();
}


/// 2.mallocBlock
/// block捕获了外界变量就会被copy到堆中.变成mallocBlock类型.
/// 跟这个block有没有被强引用或者copy没有关系.
- (void)testCreateMallocTypeBlock {
    self.mallocBlock = ^{
        
    };
    NSLog(@"没有捕获外界变量.所以是globalBlock >>%@",self.mallocBlock);
    self.mallocBlock();
    /////////////////////////////////////////////////////////////
    
    
    void (^globalBlock1)(void) = ^{

    };
    NSLog(@"没有捕获外界变量.所以是globalBlock >>%@",globalBlock1);
    globalBlock1();
    ///////////////////////////////////////////////////////////////
    
    
    NSArray *arr =@[@"1"];
    void (^globalBlock2)(void) = ^{
        NSLog(@"arr>> %p >> %p",arr,&arr);
    };
    NSLog(@"捕获了外界变量.所以是mallocBlock >>%@",globalBlock2);
    globalBlock2();
    ////////////////////////////////////////////////////////////////
}

- (void)testModifyOutVar {
    NSMutableString *a = [NSMutableString stringWithString:@"Tom"];
    
    NSLog(@"\n 定以前：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);               //a在栈区
    void (^foo)(void) = ^{
//        a.string = @"Jerry";
        NSLog(@"\n block内部：------------------------------------\n\
              a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);               //a在栈区
//        a = [NSMutableString stringWithString:@"William"];
    };
    foo();
    NSLog(@"\n 定以后：------------------------------------\n\
          a指向的堆中地址：%p；a在栈中的指针地址：%p", a, &a);               //a在栈区
}

/*
 2018-03-23 02:14:33.922387+0800 xctest[10123:1800829]
 定以前：------------------------------------
 a指向的堆中地址：0x7fb839e85a20；a在栈中的指针地址：0x7ffee0455c58
 2018-03-23 02:14:33.922639+0800 xctest[10123:1800829]
 block内部：------------------------------------
 a指向的堆中地址：0x7fb839e85a20；a在栈中的指针地址：0x7fb839f8b560
 2018-03-23 02:14:33.922840+0800 xctest[10123:1800829]
 定以后：------------------------------------
 a指向的堆中地址：0x7fb839e85a20；a在栈中的指针地址：0x7ffee0455c58
 */

- (void)test__block {
    NSMutableString *string = [NSMutableString stringWithString:@"haha"];
    NSLog(@"block前 >> %@ %p",string,string);
    void (^testBlock)(void) = ^{
        NSLog(@"block内部 >> %@ %p",string,string);
    };
    testBlock();
    NSLog(@"block执行后 >> %@ %p",string,string);
    /*
     block前 >> haha 0x7fb424741730
     block内部 >> haha 0x7fb424741730
     block执行后 >> haha 0x7fb424741730
     */
    
    __block NSMutableString *string1 = [NSMutableString stringWithString:@"fsda"];
    NSLog(@"block执行前 >> %@ %p %p",string1,string1,&string1);
    void (^testBlock1)(void) = ^{
        /// Variable is not assignable (missing __block type specifier)
        string1 = [NSMutableString stringWithString:@"fwefwe"];
        NSLog(@"block内部 >> %@ %p %p",string1,string1,&string1);
    };
    testBlock1();
    NSLog(@"block执行后 >> %@ %p  %p",string1,string1,&string1);
    /*
     block执行前 >> fsda 0x7f8185e4c150 0x7ffeedb31c20
     block内部 >> fwefwe 0x7f8185f68ac0 0x7f8185f68ab8
     block执行后 >> fwefwe 0x7f8185f68ac0  0x7f8185f68ab8
     */
    
    __block UIView *string2 = [UIView new];
    NSLog(@"block执行前 >> %@ %p %p",string2,string2,&string2);
    void (^testBlock2)(void) = ^{
        /// Variable is not assignable (missing __block type specifier)
        string2 = [UIView new];
        NSLog(@"block内部 >> %@ %p %p",string2,string2,&string2);
    };
    testBlock2();
    NSLog(@"block执行后 >> %@ %p  %p",string2,string2,&string2);
    /*
     block执行前 >> <layer = <CALayer: 0x7f8005c344b0>> 0x7f8005f562c0 0x7ffeec153bb0
     block内部 >> <layer = <CALayer: 0x7f8005e6d450>> 0x7f8005e69690 0x7f8005e69138
     block执行后 >> <layer = <CALayer: 0x7f8005e6d450>> 0x7f8005e69690  0x7f8005e69138
     */
}

/*
 测试block内部能修改局部变量string吗.(局部变量UIView也不行)
 答案: 不能
 以前以为只有整形需要加__block
 
 现在才知道原来局部变量都是放在栈里的.
 那么block内要引用局部变量.
 都需要加上__block.把这个局部变量copy到堆里.
 然后引用指向堆里的这块内存的地址.
 */

@end
