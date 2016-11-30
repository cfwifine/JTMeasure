//
//  UILabel+Create.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UILabel+Create.h"

@implementation UILabel (Create)

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                          andText:(NSString *)text
                     andTextColor:(UIColor*)textColor
                       andBgColor:(UIColor*)bgColor
                 andTextAlignment:(NSTextAlignment)textAlignment {
    UILabel *label        = [[UILabel alloc] initWithFrame:frame];
    label.text            = text;
    label.frame           = frame;
    label.textColor       = textColor;
    label.backgroundColor = bgColor;
    label.textAlignment   = textAlignment;
    
    return label;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame
                          andText:(NSString *)text
                     andTextColor:(UIColor*)textColor
                       andBgColor:(UIColor*)bgColor
                          andFont:(UIFont *)font
                 andTextAlignment:(NSTextAlignment)textAlignment {
    UILabel *label        = [[UILabel alloc] initWithFrame:frame];
    label.text            = text;
    label.frame           = frame;
    label.font            = font;
    label.textColor       = textColor;
    label.backgroundColor = bgColor;
    label.textAlignment   = textAlignment;
    
    return label;
}


@end
