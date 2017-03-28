//
//  GXPhoneBaseTableVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/3/1.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPhoneBaseTableVC.h"
#import "GXPhoneBaseTableView.h"

@interface GXPhoneBaseTableVC ()
{
    GXPhoneBaseTableView *_tableView;
}
@end

@implementation GXPhoneBaseTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_useAutoMappingCell) {
        return 10;
    } else {
        NSAssert(NO, @"GXPhoneBaseTableVC has unimplemented tableview delegate method");
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_useAutoMappingCell) {
        return 60;
    } else {
        return tableView.rowHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_useAutoMappingCell) {
        return nil;
    } else {
        NSAssert(NO, @"GXPhoneBaseTableVC has unimplemented tableview delegate method");
        return nil;
    }
}

- (GXPhoneBaseTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[GXPhoneBaseTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = self.view.backgroundColor;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (void)dealloc
{
    if (_tableView) {
        _tableView.delegate = nil;
        _tableView.dataSource = nil;
    }
}


@end
