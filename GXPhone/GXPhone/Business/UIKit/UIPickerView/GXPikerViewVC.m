//
//  GXPikerViewVC.m
//  GXPhone
//
//  Created by sunguangxin on 2017/7/17.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import "GXPikerViewVC.h"

@interface GXPikerViewVC () <UIPickerViewDataSource,UIPickerViewDelegate> {
    NSArray *models;
}

@end

@implementation GXPikerViewVC

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"选择控件";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    //数据源数组
    models = @[@"西班牙",@"韩国",@"加拿大",@"中国大陆",@"马来西亚",@"新加坡",@"俄罗斯",@"美国",@"法国"];
    
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    [self.view addSubview:pickerView];
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(300));
        make.bottom.equalTo(self.view);
    }];
}

#pragma mark -----数据源UIPickerViewDataSource代理的方法

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return models.count;
}

#pragma mark -----数据源UIPickerViewDelegate代理的方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSString *alertString = [NSString stringWithFormat:@"row%ld component%ld",row+1,component+1];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选中" message:alertString preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertButton  = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    //按钮添加到弹出框
    [alertController addAction:alertButton];
    
    //显示出来
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
    
}

//返回指定行的标题
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return models[row];
}

@end
