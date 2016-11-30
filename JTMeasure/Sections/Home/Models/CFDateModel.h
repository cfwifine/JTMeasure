//
//  CFDateModel.h
//  JTMeasure
//
//  Created by comv on 16/8/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFDateModel : NSObject

@property (nonatomic, assign) int day;
@property (nonatomic, assign) int month;
@property (nonatomic, assign) int year;
@property (nonatomic, assign) int weekDay;
@property (nonatomic, strong) NSString *lunarDay;

@end
