//
//  GXPhoneCornerTestVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/11/10.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneCornerTestVC.h"
#import "GXPhoneCornerTestCell.h"

@interface GXPhoneCornerTestVC () <UITableViewDelegate, UITableViewDataSource>
{
    int64_t _type;
}
@end

@implementation GXPhoneCornerTestVC

- (instancetype)initWithType:(int64_t)type {
    if (self = [super init]) {
        _type = type;
        switch (type) {
            case 0:
                self.title = @"无圆角";
                break;
            case 1:
                self.title = @"有圆角>>>系统方法";
                break;
            case 2:
                self.title = @"有圆角>>>CAShapeLayer";
                break;
            case 3:
                self.title = @"有圆角>>>CGGraphics";
                break;
            case 4:
                self.title = @"有圆角>>>蒙一个圆角";
                break;
                
            default:
                break;
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[GXPhoneCornerTestCell class] forCellReuseIdentifier:NSStringFromClass([GXPhoneCornerTestCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GXPhoneCornerTestCell *cell = [GXPhoneCornerTestCell initializeWithTableView:tableView indexPath:indexPath type:_type];
    [cell installWithModel:nil params:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GXPhoneCornerTestCell getHeigthWithModel:nil params:nil];
}

@end
