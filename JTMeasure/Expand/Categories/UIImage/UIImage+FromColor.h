//
//  UIImage+FromColor.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/4/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FromColor)

/**
 *  给定颜色生成图片(默认宽高1)
 */
+(UIImage *)imageFromContextWithColor:(UIColor *)color;

/**
 *  给定颜色生成图片
 */
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;


- (UIImage *) imageWithTintColor:(UIColor *)tintColor;


- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;

@end
