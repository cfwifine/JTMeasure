//
//  CalenderOperation.m
//  JTMeasure
//
//  Created by comv on 16/9/7.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "CalenderOperation.h"

@implementation CalenderOperation

/** 获取当前月第一天星期几*/
+ (NSInteger)weekdayOfFirstDayInDate:(NSDate *)date {
    NSCalendar *calender = [NSCalendar currentCalendar];
    calender.firstWeekday = 1;
    NSDateComponents *components = [calender components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    components.day = 1;
    NSDate *firstDate = [calender dateFromComponents:components];
    NSDateComponents *firstComponents = [calender components:NSCalendarUnitWeekday fromDate:firstDate];
    return firstComponents.weekday - 1;
}

/** 当前月共几天*/
+ (NSInteger)totalDaysOfMonthInDate:(NSDate *)date {
    NSRange range = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

/** date的下个月日期*/
+ (NSDate *)nextMonthDateOfDate:(NSDate *)date {
    return nil;
}

/** date的上个月日期*/
+ (NSDate *)preMonthDateOfDate:(NSDate *)date {
    return nil;
}

@end
