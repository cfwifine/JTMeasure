//
//  UITextField+Create.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Create)

// 创建TextField
+ (UITextField*)createTextFieldWithFrame:(CGRect)frame
                          andPlaceholder:(NSString*)placeholder
                        andTextAlignment:(NSTextAlignment)textAlignment
                             andFontSize:(UIFont*)font
                            andTextColor:(UIColor*)textColor;

@end
