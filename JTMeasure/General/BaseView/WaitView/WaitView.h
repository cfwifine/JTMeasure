//
//  WaitView.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaitView : UIView

+ (instancetype)sharedWaitView;

/** SV等待请求*/
- (void)showSVWaitView;

/** SV隐藏*/
- (void)dismissWaitView;

/** MB等待请求-Window*/
- (void)showMBWaitView;

/** MB等待请求-View*/
- (void)showMBWaitViewInView:(UIView *)destinationView;

/** MB隐藏*/
- (void)hideMBWaitInView:(UIView *)view;

@end
