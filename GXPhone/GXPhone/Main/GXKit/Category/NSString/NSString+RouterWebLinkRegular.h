//
//  NSString+RouterWebLinkRegular.h
//  GXModule
//
//  Created by sunguangxin on 16/10/14.
//  Copyright © 2016年 GX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RouterWebLinkRegular)

- (NSString *)tryTransferToAppScheme;

- (NSString *)transferToHomeScheme;
- (NSString *)transferToCategoryScheme;
- (NSString *)transferToConcernScheme;
- (NSString *)transferToSearchScheme;
- (NSString *)transferToUserScheme;
/**将网址追加到scheme后面.*/
- (NSString *)tryTransferToWebScheme;

/**是否是网页网址*/
- (BOOL)isWebUrl;

- (BOOL)isDirectOpenUrl;

@end
