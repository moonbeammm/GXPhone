//
//  GXPhoneProtectVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/7/18.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneProtectVC.h"

@interface GXPhonePerson ()

@property (nonatomic, assign) int32_t age;
@property (nonatomic, copy) NSString *name;

@end

@implementation GXPhonePerson

- (void)creatFood
{
    NSLog(@"创造食物!");
}

@end

///////////////////////////////////////////////////////////////////////////////////////

@interface GXPhoneProtectVC ()

@end

@implementation GXPhoneProtectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self nilProtect];
//    [self assertTest];
    [self dictProtect];
    [self objectProtect];
}

- (void)nilProtect
{
    // 1.name为nil时?必崩.
    // *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[NSPlaceholderString initWithString:]: nil argument'
//    NSString *name = nil;
//    NSString *str = [NSString stringWithString:name];
    
    // 2.name为nil时?必崩.
    // *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[__NSPlaceholderDictionary initWithObjects:forKeys:count:]: attempt to insert nil object from objects[0]'
//    NSString *name1 = nil;
//    NSDictionary *dict = @{@"name":name1};
//    NSDictionary *dict1 = @{name1:@"name"};
    
    // 3.name为nil时?必崩.
    // *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[__NSPlaceholderArray initWithObjects:count:]: attempt to insert nil object from objects[1]'
//    NSString *name2 = nil;
//    NSArray *arr = @[@"name",name2];

    // 4.
    NSString * name3 = @"";
    NSString * str1 = [NSString stringWithString:name3];
    NSLog(@"name为@""时?不崩.name:%@",str1);
    
    
    // 5.若obj为nil：
    //［obj message］将返回NO,而不是NSException
    GXPhonePerson *person = nil;
    [person creatFood];
    NSLog(@"nil发送消息?不崩");
}

- (void)assertTest
{
    BOOL assert = YES;
    NSAssert(assert == NO, @"assert不能为NO!");
    // 在release情况下.满足了assert条件.后面的代码也会被执行.
    NSLog(@"assert后面的代码被执行了.");
    
    NSString *name = nil;
    
    NSAssert(name != nil, @"name不能为nil!");
    NSLog(@"assert后面的代码被执行了.");
    // 在release情况下.满足了assert条件.后面的代码也会被执行.
    // 所以后面的代码如果会崩.那也是会崩的.
    NSString *str = [NSString stringWithString:name];
    NSLog(@"%@",str);
}

- (void)dictProtect
{
    NSDictionary *dict;
    
    // 1.dict为nil时.取值.
    // 2.从dict里取不存在的key
    NSString *name = dict[@"name"];
    NSLog(@"name:%@",name);
    
    // NULL:指向其他类型的空指针，如一个c类型的内存指针
    name = NULL;
    if (name == 0) {
        NSLog(@"NULL相当于0");
    }
    //nil:指向oc中对象的空指针
    if (name == nil) {
        NSLog(@"NULL相当于nil");
    }
    //Nil:指向oc中类的空指针
    if (name == Nil) {
        NSLog(@"NULL相当于Nil");
    }
    //NSNull：在集合对象中，表示空值的对象 
}

- (void)objectProtect
{
    GXPhonePerson *person;
    // 1.object为nil时.取值
    NSString *name = person.name;
    int32_t age = person.age;
    NSString *address = [person valueForKey:@"address"];
    NSLog(@"name:%@,age:%zd,address:%@",name,age,address);
}

@end
