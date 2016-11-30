//
//  NextVC.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/31.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "NextVC.h"
#import "WaitView.h"
#import "TestModel.h"

@interface NextVC()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end
