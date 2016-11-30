//
//  JTBaseListViewController.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "JTBaseListViewController.h"

@implementation JTBaseListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.currentPage = 1;
    
    self.pageSize = 15;
    
    self.totalSize = 0;
    
    self.dataSource = [NSMutableArray array];
}

- (void)headerRefreshAction {
    
    [self.dataSource removeAllObjects];
    
    self.currentPage = 1;
    
    [self requestListData];
}

- (void)footerRefreshAction {
    if (self.totalSize > 0) {
        
        if (self.currentPage * self.pageSize >= self.totalSize) {
            
            [ProgressHUDHandler showMBInfoTipStr:@"没有更多内容了"];
            
            [self.tableView.mj_footer resetNoMoreData];
            
            return;
        }

    }
    
    self.currentPage += 1;
    
    [self requestListData];
    
}

- (void)beginRefresh {
    if (self.tableView) {
        
        [self.tableView.mj_header beginRefreshing];
    }
    
    if (self.collectionView) {
        
        [self.collectionView.mj_header beginRefreshing];
    }
}

- (void)stopRefreshAction {
    
    if (self.tableView) {
        
        [self.tableView.mj_header endRefreshing];
    }
    
    if (self.collectionView) {
        
        [self.collectionView.mj_header endRefreshing];
    }

}

- (void)requestListData {
    //子类重写
}



@end
