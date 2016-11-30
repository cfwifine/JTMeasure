//
//  JTHomeBaseViewController.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/4/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "JTHomeBaseViewController.h"

static const NSTimeInterval kAnimationDuration = 0.2f;

@implementation JTHomeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                      NSFontAttributeName:[UIFont boldSystemFontOfSize:18]
                                                                      }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

// 页面切换视图动画
- (void)setupViewAppearAnimation {
    CATransition *transition = [CATransition animation];
    [transition setDuration:kAnimationDuration];
    [transition setType:@"fade"];
    [self.tabBarController.view.layer addAnimation:transition forKey:nil];
}

@end
