//
//  UIImage+Utils.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/26.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

/**
 *  拉伸图片:自定义比例
 */
+(UIImage *)resizeWithImageName:(NSString *)name leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap;

/**
 *  拉伸图片
 */
+(UIImage *)resizeWithImageName:(NSString *)name;

/**
 *  圆形图片
 */
+ (UIImage *)clipCircleImage:(NSString *)name;

/**
 *  图片缩放
 */
- (UIImage *)scaleImage:(UIImage *)img size:(CGSize)size;

/**
 *  圆形图片
 */
- (UIImage *)clipCircleImage;

/**
 *  图片宽高比例
 */
- (CGFloat)getImageHightWidthScale;

/**
 *  图片正立
 *
 */
- (UIImage *)fixOrientation;

/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
-(void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock;

@end
