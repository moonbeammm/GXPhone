//
//  GXObjectCacheDB.h
//  GXProject_1
//
//  Created by sunguangxin on 16/8/10.
//  Copyright © 2016年 bilibili. All rights reserved.
//

#import "GXFMDataBase.h"

@interface GXObjectCacheDB : GXFMDataBase
+ (GXObjectCacheDB *)sharedDB;
- (void)setValue:(id)value forKey:(NSString *)key;
- (id)getValueForKey:(NSString *)key;
@end
