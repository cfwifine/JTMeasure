//
//  PageShowView.h
//  JTMeasure
//
//  Created by comv on 16/9/4.
//  Copyright © 2016年 QingYe. All rights reserved.
//


/**
 该类为自定义页码展示控件，类似pageControl
 */

#import <UIKit/UIKit.h>

@interface PageShowView : UIView

//总页数
@property (nonatomic, assign) NSInteger numberOfPages;

//当前选中的页
@property (nonatomic, assign) NSInteger currentPage;

//当前选中的点颜色
@property (nonatomic, strong) UIColor *currentDotBackViewColor;

//当前选中的小点颜色
@property (nonatomic, strong) UIColor *currentDotForeViewColor;

//原点的非选中颜色
@property (nonatomic, strong) UIColor *dotBackViewColor;

- (instancetype)initWithFrame:(CGRect)frame numberOfPages:(NSInteger)numberofPages;

@end
