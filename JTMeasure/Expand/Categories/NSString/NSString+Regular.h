//
//  NSString+Regular.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/3.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regular)

/**
 *  验证邮箱
 */
+ (BOOL)isAvailableEmail:(NSString *)email;

/**
 *  验证手机
 */
+ (BOOL)valiMobile:(NSString *)mobile;

@end
