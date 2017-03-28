//
//  GXPhoneBaseTableViewCell.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/4.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneBaseTableViewCell.h"

@implementation GXPhoneBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)installCellWithModel:(NSArray *)model
{

}

+ (NSUInteger)getHeigthWithModel:(NSArray *)model
{
    return 0;
}

@end
