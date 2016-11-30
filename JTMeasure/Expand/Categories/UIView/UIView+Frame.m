//
//  UIView+Frame.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/4/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)viewMinX{
    return CGRectGetMinX(self.frame);
}

- (void)setViewMinX:(CGFloat)viewMidX{
    CGRect frame = self.frame;
    frame.origin.x = viewMidX;
    self.frame = frame;
}

- (CGFloat)viewMinY{
    return CGRectGetMinY(self.frame);
}

- (void)setViewMinY:(CGFloat)viewMinY{
    CGRect frame = self.frame;
    frame.origin.y = viewMinY;
    self.frame = frame;
}

- (CGFloat)viewMidX{
    return CGRectGetMidX(self.frame);
}

- (void)setViewMidX:(CGFloat)viewMidX{
    CGPoint center = self.center;
    center.x = viewMidX;
    self.center = center;
}

- (CGFloat)viewMidY{
    return CGRectGetMidY(self.frame);
}

- (void)setViewMidY:(CGFloat)viewMidY{
    CGPoint center = self.center;
    center.y = viewMidY;
    self.center = center;
}

- (CGFloat)viewMaxX{
    return CGRectGetMaxX(self.frame);
}

- (void)setViewMaxX:(CGFloat)viewMaxX{
    CGRect frame = self.frame;
    frame.size.width = viewMaxX - self.viewMinX;
    self.frame = frame;
}

- (CGFloat)viewMaxY{
    return CGRectGetMaxX(self.frame);
}

- (void)setViewMaxY:(CGFloat)viewMaxY{
    CGRect frame = self.frame;
    frame.size.height = viewMaxY - self.viewMinY;
    self.frame = frame;
}

- (CGFloat)viewWidth{
    return CGRectGetWidth(self.frame);
}

- (void)setViewWidth:(CGFloat)viewWidth{
    CGRect frame = self.frame;
    frame.size.width = viewWidth;
    self.frame = frame;
}

- (CGFloat)viewHeight{
    return CGRectGetHeight(self.frame);
}

- (void)setViewHeight:(CGFloat)viewHeight{
    CGRect frame = self.frame;
    frame.size.height = viewHeight;
    self.frame = frame;
}

- (CGSize)viewSize {
    return CGSizeMake(self.viewWidth, self.viewHeight);
}

- (void)setViewSize:(CGSize)viewSize {
    CGSize size = self.viewSize;
    size.width = viewSize.width;
    size.height = viewSize.height;
    self.viewSize = size;
}

- (CGPoint)viewOrigin {
    return CGPointMake(self.viewMinX, self.viewMinY);
}

- (void)setViewOrigin:(CGPoint)viewOrigin {
    CGPoint point = self.viewOrigin;
    point.x = viewOrigin.x;
    point.y = viewOrigin.y;
}

//border
- (void)borderRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width{
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.masksToBounds = YES;
}

- (void)borderRadius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}


@end
