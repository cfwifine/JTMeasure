//
//  UIView+Frame.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/4/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

//position
@property (nonatomic, assign) CGFloat viewMinX;
@property (nonatomic, assign) CGFloat viewMinY;
@property (nonatomic, assign) CGFloat viewMidX;
@property (nonatomic, assign) CGFloat viewMidY;
@property (nonatomic, assign) CGFloat viewMaxX;
@property (nonatomic, assign) CGFloat viewMaxY;

//size
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, assign) CGSize  viewSize;
@property (nonatomic, assign) CGPoint viewOrigin;

//border
- (void)borderRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width;

- (void)borderRadius:(CGFloat)radius;

@end
