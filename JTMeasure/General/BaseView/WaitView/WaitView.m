//
//  WaitView.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "WaitView.h"

@interface WaitView()

@end

@implementation WaitView

+ (instancetype)sharedWaitView {
    static dispatch_once_t predicate;
    static WaitView *sharedInstance = nil;
    _dispatch_once(&predicate, ^{
        sharedInstance = [[WaitView alloc] initWithFrame:CGRectZero];
    });
    return sharedInstance;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = [UIColor whiteColor];
}

/** SV等待请求*/
- (void)showSVWaitView {
    [ProgressHUDHandler showSVWaiting];
}

/** SV隐藏*/
- (void)dismissWaitView {
    [ProgressHUDHandler dismissSV];
    [self removeFromSuperview];
}

/** MB等待请求-Window*/
- (void)showMBWaitView {
    [self showMBWaitViewInView:[UIApplication sharedApplication].keyWindow];
}

/** MB等待请求-View*/
- (void)showMBWaitViewInView:(UIView *)destinationView {
    if (destinationView) {
        self.frame = destinationView.bounds;
        [destinationView addSubview:self];
        [ProgressHUDHandler showMBWaitingInView:destinationView];
    }
}

/** MB隐藏*/
- (void)hideMBWaitInView:(UIView *)view {
    [ProgressHUDHandler hideInView:view];
    [self removeFromSuperview];
}

@end
