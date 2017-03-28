//
//  GXFMDataBase.m
//  GXProject_1
//
//  Created by sunguangxin on 16/8/10.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "GXFMDataBase.h"


@implementation GXFMDataBase


/**
 *  通过文件名打开数据库
 *
 *  @param aName 放在沙盒caches目录下的文件名
 */
- (void)openWithName:(NSString *)aName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    if (paths != nil && paths.count > 0) {
        NSString *cachesDir = [paths objectAtIndex:0];
        NSString *dbPath = [cachesDir stringByAppendingPathComponent:aName];
        [self openWithPath:dbPath];
    }
}

- (void)openWithPath:(NSString *)aPath
{
    _dbQueue = [[FMDatabaseQueue alloc] initWithPath:aPath];
    [_dbQueue inDatabase:^(FMDatabase * db) {
        [db executeUpdate:@"CREATE TABLE IF NOT EXISTS T_KVTTable(key VARCHAR PRIMARY KEY, value VARCHAR, ts INTEGER);"];
    }];
}

- (void)close
{
    if (_dbQueue != nil) {
        [_dbQueue close];
        _dbQueue = nil;
    }
}

- (void)setValue:(NSString *)value forKey:(NSString *)key
{
    [self setValue:value forKey:key withTimeStamp:[[NSDate date] timeIntervalSince1970]];
}

- (void)setValue:(NSString *)value forKey:(NSString *)key withTimeStamp:(NSInteger)timeStamp
{
    if (_dbQueue == nil)
        return;
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT OR REPLACE INTO T_KVTTable values(? ,?, ?);" withArgumentsInArray:@[key, value, @(timeStamp)]];
    }];
}

- (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key
{
    [self setIntegerValue:value forKey:key withTimeStamp:[[NSDate date] timeIntervalSince1970]];
}

- (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key withTimeStamp:(NSInteger)timeStamp
{
    if (_dbQueue == nil)
        return;
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT OR REPLACE INTO T_KVTTable values(? ,?, ?);" withArgumentsInArray:@[key, @(value), @(timeStamp)]];
    }];
}

- (NSString *)getValueForKey:(NSString *)key
{
    return [self getValueForKey:key timeStamp:nil];
}

- (NSString *)getValueForKey:(NSString *)key timeStamp:(NSInteger *)timeStamp
{
    if (_dbQueue == nil)
        return nil;
    
    __block NSString *blockValue = nil;;
    __block NSInteger blockTimeStamp = 0;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:@"SELECT key, value, ts FROM T_KVTTable WHERE key = ?;" withArgumentsInArray:@[key]];
        if (resultSet != nil) {
            if ([resultSet next]) {
                blockValue = [resultSet stringForColumn:@"value"];
                blockTimeStamp = [resultSet longForColumn:@"ts"];
            }
            [resultSet close];
        }
    }];
    
    if (timeStamp != nil)
        *timeStamp = blockTimeStamp;
    
    return blockValue;
}

- (NSInteger)getIntegerValueForKey:(NSString *)key withDefaultValue:(NSInteger)defaultValue
{
    return [self getIntegerValueForKey:key withDefaultValue:defaultValue timeStamp:nil];
}

- (NSInteger)getIntegerValueForKey:(NSString *)key withDefaultValue:(NSInteger)defaultValue timeStamp:(NSInteger *)timeStamp
{
    if (_dbQueue == nil)
        return defaultValue;
    
    __block NSInteger blockValue = defaultValue;;
    __block NSInteger blockTimeStamp = 0;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:@"SELECT key, value, ts FROM T_KVTTable WHERE key = ?;" withArgumentsInArray:@[key]];
        if (resultSet != nil) {
            if ([resultSet next]) {
                if (![resultSet columnIsNull:@"value"])
                    blockValue = [resultSet longForColumn:@"value"];
                blockTimeStamp = [resultSet longForColumn:@"ts"];
            }
            [resultSet close];
        }
    }];
    
    if (timeStamp != nil)
        *timeStamp = blockTimeStamp;
    
    return blockValue;
}

- (void)clearDB
{
    if (_dbQueue == nil)
        return;
    
    [_dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DELETE FROM T_KVTTable;"];
    }];
}

- (void)clearValueWithKey:(NSString *)key
{
    if (_dbQueue == nil)
        return;
    [_dbQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DELETE FROM T_KVTTable WHERE key = ?;" withArgumentsInArray:@[key]];
    }];
}

@end
