//
//  UIView+DrawLine.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DrawLine)

/*
 * lineFrame:     虚线的 frame
 * length:        虚线中短线的宽度
 * spacing:       虚线中短线之间的间距
 * color:         虚线中短线的颜色
 */
+ (UIView *)createDashedLineWithFrame:(CGRect)lineFrame
                           lineLength:(int)length
                          lineSpacing:(int)spacing
                            lineColor:(UIColor *)color;

@end
