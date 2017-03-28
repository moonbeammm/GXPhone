//
//  NSString+RouterWebLinkRegular.m
//  GXModule
//
//  Created by sunguangxin on 16/10/14.
//  Copyright © 2016年 GX. All rights reserved.
//

#import "NSString+RouterWebLinkRegular.h"
#import "NSString+UrlEncode.h"

#define BILIDOMAINSUFFIX "com|tv|cn|co"

static NSRegularExpression *httpRegrex;
static NSRegularExpression *homeRegrex;

@implementation NSString (RouterWebLinkRegular)

- (NSString *)tryTransferToAppScheme
{
    NSString *scheme = nil;
    
    scheme = [self transferToHomeScheme];
    if (scheme) return scheme;
    
    scheme = [self transferToCategoryScheme];
    if (scheme) return scheme;
    
    scheme = [self transferToConcernScheme];
    if (scheme) return scheme;
    
    scheme = [self transferToSearchScheme];
    if (scheme) return scheme;
    
    scheme = [self transferToUserScheme];
    if (scheme) return scheme;
    
    return self;
}

- (NSString *)transferToHomeScheme
{
    if (!homeRegrex) {
        homeRegrex = [NSRegularExpression regularExpressionWithPattern:@"live\\.bilibili\\.("BILIDOMAINSUFFIX")\\/(\\d+)" options:NSRegularExpressionCaseInsensitive error:nil];
    }
    if (!homeRegrex) {
        // 这个url就为两个参数.
        homeRegrex = [NSRegularExpression regularExpressionWithPattern:@"live\\.bilibili\\.("BILIDOMAINSUFFIX")\\/(\\d+)\\#\\!epid\\=(\\d+)" options:NSRegularExpressionCaseInsensitive error:nil];
    }
    NSArray *matches = [homeRegrex matchesInString:self
                                           options:0
                                             range:NSMakeRange(0, [self length])];
    if (nil != matches && matches.count > 0) {
        for (NSTextCheckingResult *match in matches) {
            if (match.numberOfRanges == 3) {
                NSRange r = [match rangeAtIndex:2];
                return [NSString stringWithFormat:@"/live/%@/",[self substringWithRange:r]];
            }
            if (match.numberOfRanges == 4) {
                NSRange r = [match rangeAtIndex:2];
                NSRange e = [match rangeAtIndex:3];
                // 这里/?selectedEpId=%@表示为可选项.可能会有这个参数.也可以没有.(selecteEpId为你自定义的参数名.取值得时候就用这个key)
                return [NSString stringWithFormat:@"bangumi/season/%@/?selectedEpId=%@",[self substringWithRange:r],[self substringWithRange:e]];
            }
        }
    }
    
    return nil;
}

- (NSString *)transferToCategoryScheme
{
    return nil;
}

- (NSString *)transferToConcernScheme
{
    return nil;
}

- (NSString *)transferToSearchScheme
{
    return nil;
}

- (NSString *)transferToUserScheme
{
    return nil;
}

#pragma mark - Helper

/**是否是网页网址*/
- (BOOL)isWebUrl
{
    if ([self rangeOfString:@"http"].location == NSNotFound) {
        return NO;
    }
    if (!httpRegrex) {
        httpRegrex = [NSRegularExpression regularExpressionWithPattern:@"^((?:(http|https|Http|Https|rtsp|Rtsp):\\/\\/(?:(?:[a-zA-Z0-9\\$\\-\\_\\.\\+\\!\\*\\'\\(\\)\\,\\;\\?\\&\\=]|(?:\\%[a-fA-F0-9]{2})){1,64}(?:\\:(?:[a-zA-Z0-9\\$\\-\\_\\.\\+\\!\\*\\'\\(\\)\\,\\;\\?\\&\\=]|(?:\\%[a-fA-F0-9]{2})){1,25})?\\@)?)?(?:(([a-zA-Z0-9\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]([a-zA-Z0-9\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF\\-]{0,61}[a-zA-Z0-9\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]){0,1}\\.)+[a-zA-Z0-9\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]{2,63}|((25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1][0-9]{2}|[1-9][0-9]|[0-9]))))(?:\\:\\d{1,5})?)(\\/(?:(?:[a-zA-Z0-9\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF\\;\\/\\?\\:\\@\\&\\=\\#\\~\\-\\.\\+\\!\\*\\'\\(\\)\\,\\_])|(?:\\%[a-fA-F0-9]{2}))*)?(?:\\b|$)" options:NSRegularExpressionCaseInsensitive error:nil];
    }
    
    NSArray *matches = [httpRegrex matchesInString:self
                                           options:0
                                             range:NSMakeRange(0, [self length])];
    if (nil != matches && matches.count > 0) {
        return YES;
    }
    return NO;
}

- (BOOL)isDirectOpenUrl
{
    if ([self hasPrefix:@"https://itunes.apple.com"]) {
        return YES;
    }
    if ([self hasPrefix:@"https://appsto.re"]) {
        return YES;
    }
    return NO;
}

/**将网址追加到scheme后面.*/
- (NSString *)tryTransferToWebScheme
{
    return [NSString stringWithFormat:@"/browser/?url=%@", [self stringByUrlEncode]];
}

@end
