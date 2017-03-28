//
//  GXObjectCacheDB.m
//  GXProject_1
//
//  Created by sunguangxin on 16/8/10.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "GXObjectCacheDB.h"

#define GXObjectCacheDBName @"GXObjectCacheDBName"

@implementation GXObjectCacheDB

+ (GXObjectCacheDB *)sharedDB
{

    static GXObjectCacheDB * storage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storage = [[GXObjectCacheDB alloc] init];
    });
    return storage;
}

- (instancetype)init
{
    if (self = [super init]) {
        [super openWithName:GXObjectCacheDBName];
    }
    return self;
}

// 下面个方法是为了测试存取对象的.还未成功
- (id)getValueForKey:(NSString *)key
{
    return [self getValueForKey:key timeStamp:nil];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    [self setValue:value forKey:key withTimeStamp:[[NSDate date] timeIntervalSince1970]];
}

- (void)setValue:(id)value forKey:(NSString *)key withTimeStamp:(NSInteger)timeStamp
{
    if (self.dbQueue == nil)
        return;
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT OR REPLACE INTO T_KVTTable values(? ,?, ?);" withArgumentsInArray:@[key, value, @(timeStamp)]];
    }];
}

- (void)clearDB
{
    if (self.dbQueue == nil) {
        return;
    }
    
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        NSTimeInterval t = [[NSDate date] timeIntervalSince1970] - 3*24*60*60;
        [db executeUpdate:@"DELETE FROM T_KVTTable WHERE ts < ?;" withArgumentsInArray:@[@(t)]];
    }];
}

@end
