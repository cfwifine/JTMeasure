//
//  DrawLineUtil.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/21.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrawLineUtil : NSObject

//绘制直线
+ (void)dl_drawRealLineWithContex:(CGContextRef)contex
                        Width:(CGFloat)width
                        color:(UIColor *)color
                    fromPoint:(CGPoint)fromPoint
                      toPoint:(CGPoint)toPoint;

//绘制虚线
+ (void)dl_drawDashLineWithContex:(CGContextRef)context
                            Width:(CGFloat)width
                            color:(UIColor *)color
                        fromPoint:(CGPoint)fromPoint
                          toPoint:(CGPoint)toPoint;

@end
