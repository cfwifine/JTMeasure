//
//  DrawLineUtil.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/21.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "DrawLineUtil.h"

@implementation DrawLineUtil

+ (void)dl_drawRealLineWithContex:(CGContextRef)contex
                            Width:(CGFloat)width
                            color:(UIColor *)color
                        fromPoint:(CGPoint)fromPoint
                          toPoint:(CGPoint)toPoint {
    
    CGMutablePathRef linepPath = CGPathCreateMutable();
    CGContextSetLineWidth(contex, width);
    CGContextSetStrokeColorWithColor(contex, color.CGColor);
    CGPathMoveToPoint(linepPath, NULL, fromPoint.x, fromPoint.y);
    CGPathAddLineToPoint(linepPath, NULL, toPoint.x, toPoint.y);
    CGContextAddPath(contex, linepPath);
    CGContextStrokePath(contex);
    CGPathRelease(linepPath);
}

+ (void)dl_drawDashLineWithContex:(CGContextRef)context
                            Width:(CGFloat)width
                            color:(UIColor *)color
                        fromPoint:(CGPoint)fromPoint
                          toPoint:(CGPoint)toPoint {
    CGMutablePathRef dashLinePaht = CGPathCreateMutable();
    CGContextSetLineWidth(context, width);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGFloat lengths[] = {5,5};
    CGContextSetLineDash(context, 0, lengths, 2);
    CGPathMoveToPoint(dashLinePaht, NULL, fromPoint.x, fromPoint.y);
    CGPathAddLineToPoint(dashLinePaht, NULL, toPoint.x, toPoint.y);
    CGContextAddPath(context, dashLinePaht);
    CGContextStrokePath(context);
    CGPathRelease(dashLinePaht);
}

@end
