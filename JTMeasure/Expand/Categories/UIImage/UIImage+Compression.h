//
//  UIImage+Compression.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/3.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compression)

/**
 *  压缩图片到指定文件大小
 */
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

/**
 *  压缩图片到指定宽高和文件大小
 */
+ (NSData *)compressOriginalImageData:(NSData *)imageData originImage:(UIImage *)image toSize:(CGSize)size minSize:(CGFloat)minByte;

@end
