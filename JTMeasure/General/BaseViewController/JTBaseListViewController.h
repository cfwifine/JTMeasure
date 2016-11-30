//
//  JTBaseListViewController.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "BaseViewController.h"

@interface JTBaseListViewController : BaseViewController

@property (nonatomic, assign) NSInteger currentPage;  // 当前页

@property (nonatomic, assign) NSInteger pageSize;  //没页条数

@property (nonatomic, assign) NSInteger totalSize; //总条数

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionView;

/** 下拉刷新*/
- (void)headerRefreshAction;

/** 上拉刷新*/
- (void)footerRefreshAction;

/** 停止刷新*/
- (void)stopRefreshAction;

/** 请求列表数据*/
- (void)requestListData;

@end
