//
//  GXPhoneTwoScrollVC.m
//  GXPhone
//
//  Created by sgx on 2018/2/24.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneTwoScrollVC.h"
#import "GXPhoneTwoScrollView.h"

@interface GXPhoneTwoScrollVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) GXPhoneTwoScrollView *scrollView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GXPhoneTwoScrollVC

/*
 load 放在程序启动的时候就会挨个调用.
 分类或者子类重写了并不会覆盖.
 */
+ (void)load {
    [super load];
    NSLog(@"我的+load方法被子类/分类重写了.%@",self);
    NSLog(@"测试");
}
/*
 如果本类的分类重写了initialize方法(除了load方法.其他方法都会被分类覆盖)
 那本类的此方法会被分类覆盖.
 就不会被调用了.
 */
+ (void)initialize {
    [super initialize];
    NSLog(@"sgx 我是父类.重写了initilize方法%@",self);
}

/*
 2018-03-30 00:25:46.680766+0800 GXUniversal[30739:3597111] 我的+load方法被子类/分类重写了.
 2018-03-30 00:25:46.681030+0800 GXUniversal[30739:3597111] sgx 我是分类two.重写了initilize方法GXPhoneTwoScrollVC
 2018-03-30 00:25:46.681471+0800 GXUniversal[30739:3597111] 我是分类two>> 重写了+load方法.
 2018-03-30 00:25:46.681601+0800 GXUniversal[30739:3597111] 我是子类.重写了父类+load方法.
 2018-03-30 00:25:46.681708+0800 GXUniversal[30739:3597111] 我是分类one>> 重写了+load方法.
 2018-03-30 00:25:46.681794+0800 GXUniversal[30739:3597111] 我是分类two>> 重写了+load方法.
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"测试两个手势冲突问题.";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sunguangxin"];
    cell.textLabel.text = [NSString stringWithFormat:@"sunguangxin-->>%zd",indexPath.row];
    return cell;
}

#pragma mark - Initialize Method

- (void)configSubviews {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.topView];
    [self.scrollView addSubview:self.tableView];
    self.scrollView.contentSize =CGSizeMake(self.view.frame.size.width, 1300);
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.scrollView);
        make.height.equalTo(@(100));
        make.width.equalTo(self.view);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom);
        make.left.equalTo(self.scrollView);
        make.width.equalTo(@(250));
        make.height.equalTo(@(1200));
    }];
}

- (GXPhoneTwoScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[GXPhoneTwoScrollView alloc] init];
    }
    return _scrollView;
}

- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor redColor];
    }
    return _topView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sunguangxin"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
