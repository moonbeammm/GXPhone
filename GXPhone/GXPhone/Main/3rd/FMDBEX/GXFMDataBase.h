//
//  GXFMDataBase.h
//  GXProject_1
//
//  Created by sunguangxin on 16/8/10.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface GXFMDataBase : NSObject

- (void)openWithPath:(NSString *)aPath;
- (void)openWithName:(NSString *)aName;
- (void)close;


- (void)setValue:(NSString *)value forKey:(NSString *)key;
- (void)setValue:(NSString *)value forKey:(NSString *)key withTimeStamp:(NSInteger)timeStamp;

- (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key;
- (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key withTimeStamp:(NSInteger)timeStamp;


- (NSString *)getValueForKey:(NSString *)key;
- (NSString *)getValueForKey:(NSString *)key timeStamp:(NSInteger *)timeStamp;

- (NSInteger)getIntegerValueForKey:(NSString *)key withDefaultValue:(NSInteger)defaultValue;
- (NSInteger)getIntegerValueForKey:(NSString *)key withDefaultValue:(NSInteger)defaultValue timeStamp:(NSInteger *)timeStamp;

- (void)clearDB;
- (void)clearValueWithKey:(NSString *)key;

@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

@end
