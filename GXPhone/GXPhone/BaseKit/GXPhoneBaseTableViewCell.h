//
//  GXPhoneBaseTableViewCell.h
//  GXPhone
//
//  Created by sunguangxin on 2017/3/4.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GXPhoneBaseTableViewCell : UITableViewCell

- (void)installCellWithModel:(NSArray *)model;
+ (NSUInteger)getHeigthWithModel:(NSArray *)model;

@end
