//
//  ProgressHUDHandler.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/2.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgressHUDHandler : NSObject

//**************************  SVProgress  ********************

/** SV成功提示*/
+ (void)showSVSuccessTipStr:(NSString *)tipStr;

/** SV错误提示*/
+ (void)showSVErrorTipStr:(NSString *)errorStr;

/** SV提示信息*/
+ (void)showSVInfoTipStr:(NSString *)errorStr;

/** SV等待提示*/
+ (void)showSVWaiting;

/** SV下载、上传进度*/
+ (void)showSVProgress:(float)progress;

/** SV隐藏*/
+ (void)dismissSV;

//**************************  MBProgress  ********************

/** MB成功提示*/
+ (void)showMBSuccessTipStr:(NSString *)tipStr;

/** MB错误提示*/
+ (void)showMBErrorTipStr:(NSString *)errorStr;

/** 提示信息*/
+ (void)showMBInfoTipStr:(NSString *)errorStr;

/** MB等待提示*/
+ (void)showMBWaitingInView:(UIView *)view;

/** MB隐藏*/
+ (void)hideInView:(UIView *)view;

@end
