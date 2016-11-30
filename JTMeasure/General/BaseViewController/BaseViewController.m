//
//  BaseViewController.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/13.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "BaseViewController.h"
#import "WaitView.h"
#import "FailureView.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

#pragma mark -- 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)dealloc {
    DebugLog(@"dealloc:%@",NSStringFromClass(self.class));
    [[JTClient sharedManager] cancelRequest]; //页面销毁时取消网络任务
}

#pragma mark -- JTClientProtocol
- (void)client:(JTClient *)client progress:(float)progress{}
- (void)client:(JTClient *)client key:(NSString *)key resultData:(NSDictionary *)result{}
- (void)client:(JTClient *)client key:(NSString *)key failWithError:(NSError *)error{}

#pragma mark -- 界面跳转
//界面跳转
- (void)pushToViewController:(UIViewController *)toViewController withPamarm:(id)param {
    NSAssert(self.navigationController, @"push 时navigationController不能为空!");
    if (param) self.param = param;
    [self.navigationController pushViewController:toViewController animated:YES];
}

//pop返回前面页面
- (void)popToPreView {
    NSAssert(self.navigationController, @"pop 时navigationController不能为空!");
    [self.navigationController popViewControllerAnimated:YES];
}

//dismiss返回前面页面
- (void)dismissGobackWithCompletionBlock:(dismissCompletionBlock)block {
    [self dismissViewControllerAnimated:YES completion:block];
}

//pop返回指定页面
- (void)popToViewController:(id)toViewController {
    NSAssert(self.navigationController, @"pop 时navigationController不能为空!");
    [self.navigationController popToViewController:toViewController animated:YES];
}

//显示正在加载提示页面
- (void)showWaitingInView:(UIView *)view isMB:(BOOL)isMB {
    if (isMB) {
        [[WaitView sharedWaitView] showMBWaitViewInView:view];
    }else {
        [[WaitView sharedWaitView] showSVWaitView];
    }
}

//隐藏加载提示页面
- (void)hideWaitingInView:(UIView *)view isMB:(BOOL)isMB {
    if (isMB) {
        [[WaitView sharedWaitView] hideMBWaitInView:view];
    }else {
        [[WaitView sharedWaitView] dismissWaitView];
    }
}

//显示重新加载页面
- (void)showFailureViewInView:(UIView *)view {
    [[FailureView sharedFailureView] showFailureViewInView:view];
    __weak typeof(*&self) weakSelf = self;
    [FailureView sharedFailureView].reloadButtonClikedBlock = ^(UIButton *sender) {
        [weakSelf hideFailureView];
        [weakSelf loadRequest];
    };
}

//隐藏重新加载页面
- (void)hideFailureView {
    [[FailureView sharedFailureView] hideFilureViewFromeView];
}

//需要重新加载的子类重写该方法
- (void)loadRequest {
    //子类重写
}

@end
