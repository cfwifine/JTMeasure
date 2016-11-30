//
//  UITextField+Create.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UITextField+Create.h"

@implementation UITextField (Create)

// 创建TextField
+ (UITextField*)createTextFieldWithFrame:(CGRect)rect
                          andPlaceholder:(NSString*)placeholder
                        andTextAlignment:(NSTextAlignment)textAlignment
                             andFontSize:(UIFont*)font
                            andTextColor:(UIColor*)textColor{
    
    UITextField* textField = [[UITextField alloc] initWithFrame:rect];
    
    textField.borderStyle              = UITextBorderStyleNone;
    textField.returnKeyType            = UIReturnKeyDefault;
    textField.placeholder              = placeholder;
    textField.clearButtonMode          = UITextFieldViewModeWhileEditing;
    textField.textAlignment            = textAlignment;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.keyboardType             = UIKeyboardTypeDefault;
    textField.keyboardAppearance       = UIKeyboardAppearanceDefault;
    textField.autocapitalizationType   = UITextAutocapitalizationTypeAllCharacters;
    textField.autocorrectionType       = UITextAutocorrectionTypeNo;
    textField.font                     = font;
    textField.textColor                = textColor;
    
    UIView *paddingView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    paddingView.backgroundColor = [UIColor clearColor];
    textField.leftView                 = paddingView;
    textField.leftViewMode             = UITextFieldViewModeAlways;
    
    return textField;
}

@end
