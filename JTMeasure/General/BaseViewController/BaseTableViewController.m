//
//  BaseTableViewController.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/21.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "BaseTableViewController.h"
#import "BaseCell.h"
#import "MJRefresh.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)initData {
    self.dataSource = [NSMutableArray array];
    self.pageNo = 1;
    self.pageSize = 15;
    self.total = 0;
}

#pragma mark -- UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //子类可重写
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //子类可重写
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //子类可重写
    static NSString *cellID = @"BaseCell";
    BaseCell *cell = [BaseCell cellWithTableView:tableView style:UITableViewCellStyleDefault identifier:cellID byXib:NO];
    cell.textLabel.text = [@(indexPath.row) stringValue];
    return cell;
}

- (void)requestTableViewData {
    //子类实现
}

- (void)headerRefreshAction {
    self.pageNo = 1;
    [self.dataSource removeAllObjects];
    [self requestTableViewData];
}

- (void)footerRefreshAction {
    if ([self.tableView.mj_header isRefreshing]) {
        [self.tableView.mj_header endRefreshing];
    }
    self.pageNo += 1;
    [self requestTableViewData];
}

- (void)handleRequestResultDataWith:(NSArray *)dataArr {
    [self.dataSource addObjectsFromArray:dataArr];
    if (self.dataSource.count >= self.total) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        [self.tableView.mj_header endRefreshing];
    }else {
        [self.tableView.mj_footer resetNoMoreData];
    }
    [self.tableView reloadData];
}

@end
