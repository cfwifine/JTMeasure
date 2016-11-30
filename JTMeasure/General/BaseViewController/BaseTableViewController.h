//
//  BaseTableViewController.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/21.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
}
@property (nonatomic, strong) UITableView *tableView;    //tableView
@property (nonatomic, strong) NSMutableArray *dataSource;//数据源数组
@property (nonatomic, assign) NSInteger pageNo; //单前页
@property (nonatomic, assign) NSInteger pageSize; //每页量数
@property (nonatomic, assign) NSInteger total; //总条数

/**
 *  请求列表数据，子类实现
 */
- (void)requestTableViewData;

/**
 *  下拉刷新事件
 */
- (void)headerRefreshAction;

/**
 *  上拉刷新事件
 */
- (void)footerRefreshAction;

/**
 *  处理返回的数据
 */
- (void)handleRequestResultDataWith:(NSArray *)dataArr;

@end
