//
//  NSString+DateStringConvert.h
//  GXModule
//
//  Created by sunguangxin on 16/10/14.
//  Copyright © 2016年 GX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateStringConvert)

/**
 *  @"2016-09-09 5:00:00"  --- >>>  @"9月9日5时"
 */
- (NSString *)dateStringConvertWithDateString:(NSString *)string;

@end
