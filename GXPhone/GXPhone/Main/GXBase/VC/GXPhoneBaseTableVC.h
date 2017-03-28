//
//  GXPhoneBaseTableVC.h
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneBaseVC.h"

@class GXPhoneBaseTableView;
@interface GXPhoneBaseTableVC : GXPhoneBaseVC <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readonly) UITableView *tableView;
@property (nonatomic, assign) BOOL useAutoMappingCell;

@end
