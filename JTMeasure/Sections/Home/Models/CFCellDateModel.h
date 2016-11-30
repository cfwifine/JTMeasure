//
//  CFCellDateModel.h
//  JTMeasure
//
//  Created by comv on 16/8/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//


/**
 *  该类为一个model类，主要为复用的视图提供数据模型
 */


#import <Foundation/Foundation.h>

@class CFDateModel;
@interface CFCellDateModel : NSObject

@property (nonatomic, strong) NSArray <CFDateModel *> *dateModels;
@property (nonatomic, assign) int drawDayBeginIndex;
@property (nonatomic, assign) int drawDayRow;
@property (nonatomic, assign) int year;
@property (nonatomic, assign) int month;
@property (nonatomic, assign) int daysOfMonth;
@property (nonatomic, assign) int beginWeekDay;


@end
