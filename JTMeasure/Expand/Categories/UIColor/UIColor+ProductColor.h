//
//  UIColor+ProductColor.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/4/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ProductColor)

/***************************项目颜色***************************/
+ (UIColor *)app_Glob_Navibar_Color;

+ (UIColor *)app_Glob_Tabbar_Color;

+ (UIColor *)app_Glob_ViewBackground_Color;

+ (UIColor *)app_Glob_ButtonNomal_Color;

+ (UIColor *)app_Glob_ButtonHightlight_Color;

+ (UIColor *)app_Glob_ButtonDisable_Color;

+ (UIColor *)app_Glob_Font_Color;

+ (UIColor *)app_Glob_Border_Color;


/***************************类方法***************************/
/**
 *  生成随机色
 */
+ (UIColor *)randomColor;

/**
 *  十六进制颜色生成UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
