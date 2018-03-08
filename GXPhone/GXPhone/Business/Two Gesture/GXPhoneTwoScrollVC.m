//
//  GXPhoneTwoScrollVC.m
//  GXPhone
//
//  Created by sgx on 2018/2/24.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXPhoneTwoScrollVC.h"
#import "GXPhoneTwoScrollView.h"
#import "GXPhoneKVOPerson.h"

@interface GXPhoneTwoScrollVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) GXPhoneTwoScrollView *scrollView;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *mutArr;
@property (nonatomic, strong) NSMutableArray *mutArr2;
@property (nonatomic, strong) NSMutableArray *largeArr;
@property (nonatomic, strong) GXPhoneKVOPerson *person;

@end

@implementation GXPhoneTwoScrollVC

+ (void)load {
    [super load];
    NSLog(@"sunguangxin >> load");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"测试两个手势冲突问题.";
        self.mutArr = [NSMutableArray arrayWithArray:@[@"1"]];
        self.mutArr2 = self.mutArr;
        self.person = [[GXPhoneKVOPerson alloc] init];
    }
    return self;
}

//- (void)setMutArr:(NSMutableArray *)mutArr {
//    _mutArr = mutArr;
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"mutArra"];
    
    [self configSubviews];
    
    [RACObserve(self.person, name) subscribeNext:^(id x) {
        NSLog(@"mutArr 改变了");
    }];
    [self.mutArr addObject:@"22"];
//    self.mutArr = [NSMutableArray arrayWithArray:@[@1,@3]];
    
    self.person.name = @"hehe";
    
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@对象的%@属性改变了：%@", object, keyPath, change);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    self.mutArr[0] = @"2";
    NSLog(@"sunguangxin >> %@",self.mutArr2[0]);
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
