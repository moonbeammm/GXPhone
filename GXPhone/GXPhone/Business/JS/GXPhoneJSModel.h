//
//  GXPhoneJSModel.h
//  GXPhone
//
//  Created by sgx on 2018/3/6.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXPhoneJSModel : NSObject

+ (id)parseByJavaScriptWithRawContent:(NSString *)rawContent;

@end
