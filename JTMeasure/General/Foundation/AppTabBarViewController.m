//
//  AppTabBarViewController.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/13.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "AppTabBarViewController.h"
#import "HomeVC.h"
#import "ServerVC.h"
#import "ParticularVC.h"
#import "MeVC.h"
#import "BaseNavigationViewController.h"

@interface AppTabBarViewController ()

@end

@implementation AppTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeVC *homeVC             = [[HomeVC alloc] init];
    ServerVC *serverVC         = [[ServerVC alloc] init];
    ParticularVC *particularVC = [[ParticularVC alloc] init];
    MeVC *meVC                 = [[MeVC alloc] init];
    
//    homeVC.tabBarItem       = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil selectedImage:nil];
//    serverVC.tabBarItem     = [[UITabBarItem alloc] initWithTitle:@"客服" image:nil selectedImage:nil];
//    particularVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"加盟合作" image:nil selectedImage:nil];
//    meVC.tabBarItem         = [[UITabBarItem alloc] initWithTitle:@"我的" image:nil selectedImage:nil];
    
    homeVC.tabBarItem       = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    serverVC.tabBarItem     = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    particularVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
    meVC.tabBarItem         = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:3];
    
    BaseNavigationViewController *homeNavi       = [[BaseNavigationViewController alloc] initWithRootViewController:homeVC];
    BaseNavigationViewController *serverNavi     = [[BaseNavigationViewController alloc] initWithRootViewController:serverVC];
    BaseNavigationViewController *particularNavi = [[BaseNavigationViewController alloc] initWithRootViewController:particularVC];
    BaseNavigationViewController *meNavi         = [[BaseNavigationViewController alloc] initWithRootViewController:meVC];
    
    self.viewControllers = @[homeNavi, serverNavi, particularNavi, meNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc {
    DebugLog(@"...dealloc...%@",self.class);
}

@end