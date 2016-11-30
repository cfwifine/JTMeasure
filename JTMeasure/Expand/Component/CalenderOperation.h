//
//  CalenderOperation.h
//  JTMeasure
//
//  Created by comv on 16/9/7.
//  Copyright © 2016年 QingYe. All rights reserved.
//


/**
 *  该类专门用来处理日历相关的，主要是根据NSDate来获取日历的相关数据
 */



#import <Foundation/Foundation.h>

@interface CalenderOperation : NSObject

/** 获取当前月第一天星期几*/
+ (NSInteger)weekdayOfFirstDayInDate:(NSDate *)date;

/** 当前月共几天*/
+ (NSInteger)totalDaysOfMonthInDate:(NSDate *)date;

/** date的下个月日期*/
+ (NSDate *)nextMonthDateOfDate:(NSDate *)date;

/** date的上个月日期*/
+ (NSDate *)preMonthDateOfDate:(NSDate *)date;



@end
