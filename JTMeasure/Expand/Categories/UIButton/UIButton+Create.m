//
//  UIButton+Create.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UIButton+Create.h"

@implementation UIButton (Create)

+ (UIButton *)createButtonWithButtonType:(UIButtonType)buttonType
                                andFrame:(CGRect)frame
                                andTitle:(NSString *)title
                                 andFont:(UIFont *)font
                           andTitleColor:(UIColor *)titleColor
                      andBackgroundColor:(UIColor *)backgroundColor{
    
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = frame;
    button.backgroundColor = backgroundColor;
    button.titleLabel.font = font;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    return button;
}

+ (UIButton *)createButtonWithButtonType:(UIButtonType)buttonType
                                andFrame:(CGRect)frame
                                andTitle:(NSString *)title
                           andTitleColor:(UIColor *)titleColor {
    
    UIButton *button = [UIButton createButtonWithButtonType:buttonType andFrame:frame andTitle:title andTitleColor:titleColor andBackgroundColor:[UIColor whiteColor]];
    
    return button;
}

+ (UIButton *)createButtonWithButtonType:(UIButtonType)buttonType
                                andFrame:(CGRect)frame
                                andTitle:(NSString *)title
                           andTitleColor:(UIColor *)titleColor
                      andBackgroundColor:(UIColor *)backgroundColor {
    UIButton *button = [UIButton createButtonWithButtonType:buttonType andFrame:frame andTitle:title andFont:nil andTitleColor:titleColor andBackgroundColor:backgroundColor];
    
    return button;
}


@end
