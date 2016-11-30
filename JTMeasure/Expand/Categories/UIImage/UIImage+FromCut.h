//
//  UIImage+FromCut.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/4/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FromCut)

/*
 *  圆形图片
 */
@property (nonatomic,strong,readonly) UIImage *roundImage;


/**
 *  从给定UIView中截图：UIView转UIImage
 */
+(UIImage *)cutFromView:(UIView *)view;

/**
 *  截取view中某个区域生成一张图片
 */
+ (UIImage *)shotWithView:(UIView *)view scope:(CGRect)scope;

/**
 *  直接截屏
 */
+(UIImage *)cutScreen;

/**
 *  从给定UIImage和指定Frame截图：
 */
-(UIImage *)cutWithFrame:(CGRect)frame;

@end
