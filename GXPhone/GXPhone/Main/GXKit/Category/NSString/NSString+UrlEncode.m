//
//  NSString+UrlEncode.m
//  GXModule
//
//  Created by sunguangxin on 16/10/14.
//  Copyright © 2016年 GX. All rights reserved.
//

#import "NSString+UrlEncode.h"

@implementation NSString (UrlEncode)
- (NSString *)stringByUrlEncode
{
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, NULL, CFSTR("!*'\"();:@&=+$,/?%#[]% "), kCFStringEncodingUTF8);
}
@end
