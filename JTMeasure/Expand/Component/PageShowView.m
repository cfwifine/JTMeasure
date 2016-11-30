//
//  PageShowView.m
//  JTMeasure
//
//  Created by comv on 16/9/4.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "PageShowView.h"

@interface PageShowView()

{
    UIView *dotBackView;  //背景原点
    UIView *dotForeView; //当前选中的原点
    NSMutableArray *dotBackViews;
    NSMutableArray *dotForeViews;
    UIView *preDotForeView; //之前选中的fore
    UIView *preDotBackView; //之前选中的back
}

@end

@implementation PageShowView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        [self initData];
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame numberOfPages:(NSInteger)numberofPages {
    _numberOfPages = numberofPages;
    return [self initWithFrame:frame];
}

- (void)initData {
    dotBackViews = [NSMutableArray array];
    dotForeViews = [NSMutableArray array];
    _currentDotBackViewColor = [UIColor grayColor];
    _currentDotForeViewColor = [UIColor whiteColor];
    _dotBackViewColor = [UIColor orangeColor];
}

- (void)initUI {
    for (int i = 0; i < self.numberOfPages; i ++) {
        dotBackView = [[UIView alloc] initWithFrame:CGRectMake((5 + 8) * i, (self.bounds.size.height - 8) / 2, 8.f, 8.f)];
        dotBackView.backgroundColor = self.dotBackViewColor;
        dotBackView.layer.cornerRadius = 8.f / 2;
        dotBackView.layer.masksToBounds = YES;
        [self addSubview:dotBackView];
        
        dotForeView = [[UIView alloc] initWithFrame:CGRectMake(1.f, 1.f, CGRectGetWidth(dotBackView.frame) - 2.f, CGRectGetWidth(dotBackView.frame) - 2.f)];
        dotForeView.layer.cornerRadius = (CGRectGetWidth(dotBackView.frame) - 2.f) / 2;
        dotForeView.layer.masksToBounds = YES;
        dotForeView.hidden = YES;
        dotForeView.backgroundColor = self.currentDotForeViewColor;
        [dotBackView addSubview:dotForeView];
        
        [dotBackViews addObject:dotBackView];
        [dotForeViews addObject:dotForeView];
        
        preDotForeView = dotForeView;
        preDotBackView = dotBackView;
    }
}


- (void)setNumberOfPages:(NSInteger)numberOfPages {
    _numberOfPages = numberOfPages;
}

- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    if (currentPage < dotBackViews.count) {
        UIView *backView = [dotBackViews objectAtIndex:currentPage];
        UIView *foreView = [dotForeViews objectAtIndex:currentPage];
        
        backView.backgroundColor = self.currentDotBackViewColor;
        foreView.backgroundColor = self.currentDotForeViewColor;
        
        foreView.hidden = NO;
        preDotForeView.hidden = YES;
        preDotBackView.backgroundColor = self.dotBackViewColor;
        
        preDotForeView = foreView;
        preDotBackView = backView;
    }
}




@end
