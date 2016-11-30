//
//  UIButton+Create.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Create)

+ (UIButton *)createButtonWithButtonType:(UIButtonType)buttonType
                                andFrame:(CGRect)frame
                                andTitle:(NSString *)title
                           andTitleColor:(UIColor *)titleColor;


+ (UIButton *)createButtonWithButtonType:(UIButtonType)buttonType
                                andFrame:(CGRect)frame
                                andTitle:(NSString *)title
                           andTitleColor:(UIColor *)titleColor
                      andBackgroundColor:(UIColor *)backgroundColor;

+ (UIButton *)createButtonWithButtonType:(UIButtonType)buttonType
                                andFrame:(CGRect)frame
                                andTitle:(NSString *)title
                                 andFont:(UIFont *)font
                           andTitleColor:(UIColor *)titleColor
                      andBackgroundColor:(UIColor *)backgroundColor;

@end
