//
//  AppRootViewController.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/13.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "AppRootViewController.h"
#import "AppDelegate.h"
#import "AppTabBarViewController.h"
#import "AppMainPageViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import <RESideMenu.h>

@interface AppRootViewController ()

@end

@implementation AppRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [AppRootViewController setTabBarRootViewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

+ (void)setMainPageRootViewController {
    
    AppMainPageViewController *mainPageVC = [[AppMainPageViewController alloc] initWithNibName:NSStringFromClass([AppMainPageViewController class]) bundle:nil];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.window.rootViewController = mainPageVC;
}

+ (void)setTabBarRootViewController {
    
    AppTabBarViewController *tabBarVC = [[AppTabBarViewController alloc] init];
    
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    
    RightViewController *rightVC = [[RightViewController alloc] init];
    
    RESideMenu *sideMenu = [[RESideMenu alloc] initWithContentViewController:tabBarVC leftMenuViewController:leftVC rightMenuViewController:rightVC];
    
    sideMenu.view.backgroundColor = [UIColor whiteColor];
    
    sideMenu.scaleContentView = NO;
    
    sideMenu.scaleBackgroundImageView = NO;
    
    sideMenu.contentViewInPortraitOffsetCenterX = [UIScreen mainScreen].bounds.size.width / 2 - 60;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.window.rootViewController = sideMenu;
    
}

@end
