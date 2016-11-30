//
//  CFDateView.h
//  JTMeasure
//
//  Created by comv on 16/8/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFDateModel.h"

@interface CFDateView : UIView

//缩放比例，默认1.0
@property (nonatomic, assign) CGFloat scale;

//新历
@property (nonatomic, strong) UILabel *solarCalendarLabel;

//农历
@property (nonatomic, strong) UILabel *lunarCalendarLabel;

//当前View的model
@property (nonatomic, strong) CFDateModel *dateModel;

//填充数据
- (void)configDate:(CFDateModel *)dateModel;

@end
