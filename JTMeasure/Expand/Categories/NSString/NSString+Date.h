//
//  NSString+Date.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/3.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

/**
 *  获取当前时间
 *  format: @"yyyy-MM-dd HH:mm:ss"、@"yyyy年MM月dd日 HH时mm分ss秒"
 */
+ (NSString *)currentDateWithFormat:(NSString *)format;

/**
 *  上次日期离现在多久
 */
+ (NSString *)timeIntervalFromLastTime:(NSDate *)lastTime
                         ToCurrentTime:(NSDate *)currentTime;

/**
 *  计算上次日期距离现在多久
 *
 *  @param lastTime    上次日期(需要和格式对应)
 *  @param format1     上次日期格式
 *  @param currentTime 最近日期(需要和格式对应)
 *  @param format2     最近日期格式
 *
 *  @return xx分钟前、xx小时前、xx天前
 */
+ (NSString *)timeIntervalFromLastTime:(NSString *)lastTime
                        lastTimeFormat:(NSString *)format1
                         ToCurrentTime:(NSString *)currentTime
                     currentTimeFormat:(NSString *)format2;

/**
 *  时间戳转成字符串时间
 */
+ (NSString *)timeIntervalFromSamp:(NSTimeInterval)samp
                     timeFormatter:(NSString *)formater;

@end
