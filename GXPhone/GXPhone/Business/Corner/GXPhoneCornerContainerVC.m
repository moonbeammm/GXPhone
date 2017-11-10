//
//  GXPhoneCornerContainerVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/11/10.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneCornerContainerVC.h"
#import "GXPhoneNavigator.h"

@interface GXPhoneCornerContainerVC () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation GXPhoneCornerContainerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"GXPhoneCornerContainerVC"];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GXPhoneCornerContainerVC" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"无圆角";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"有圆角>>>系统方法";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"有圆角>>>CAShapLayer";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"有圆角>>>CGGraphics";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"有圆角>>>>蒙一个圆角图片";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[GXPhoneNavigator shared] showCornerTestVCWithType:indexPath.row];
}

@end
