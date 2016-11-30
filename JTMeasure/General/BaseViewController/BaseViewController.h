//
//  BaseViewController.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/13.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTClient.h"
#import "JTClientProtocol.h"

typedef void(^dismissCompletionBlock)(void);

@interface BaseViewController : UIViewController<JTClientProtocol>

//传到下个界面的值
@property (nonatomic, strong) id param;

//当前登录用户信息
@property (nonatomic, strong) id curUserModel;

//界面跳转
- (void)pushToViewController:(UIViewController *)toViewController withPamarm:(id)param;

//pop返回前面页面
- (void)popToPreView;

//dismiss返回前面页面
- (void)dismissGobackWithCompletionBlock:(dismissCompletionBlock)block;

//pop返回指定页面
- (void)popToViewController:(id)toViewController;

//显示正在加载提示页面
- (void)showWaitingInView:(UIView *)view isMB:(BOOL)isMB;

//隐藏加载提示页面
- (void)hideWaitingInView:(UIView *)view isMB:(BOOL)isMB;

//显示重新加载页面
- (void)showFailureViewInView:(UIView *)view;

//隐藏重新加载页面
- (void)hideFailureView;

//需要重新加载的子类重写该方法
- (void)loadRequest;

@end

