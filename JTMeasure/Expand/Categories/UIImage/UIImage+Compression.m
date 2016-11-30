//
//  UIImage+Compression.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/3.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UIImage+Compression.h"

@implementation UIImage (Compression)

//压缩图片到指定文件大小
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length/1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}

+ (NSData *)compressOriginalImageData:(NSData *)imageData originImage:(UIImage *)image toSize:(CGSize)size minSize:(CGFloat)minByte{
    if (imageData.length/1024 > minByte) {
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        if (image.size.width < image.size.height) {
            if (image.size.width > size.width) {
                CGFloat needScale = size.width / image.size.width;
                CGSize size = CGSizeMake(image.size.width * needScale, image.size.height * needScale);
                // 创建一个bitmap的context
                // 并把它设置成为当前正在使用的context
                UIGraphicsBeginImageContext(size);
                // 绘制改变大小的图片
                [image drawInRect:CGRectMake(0, 0,size.width, size.height)];
                // 从当前context中创建一个改变大小后的图片
                UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
                // 使当前的context出堆栈
                UIGraphicsEndImageContext();
                // 返回新的改变大小后的图片
                imageData = UIImageJPEGRepresentation(scaledImage, 1.0);
                if ((float)imageData.length/1024 > minByte) {
                    CGFloat quality =  screenHeight == 480 ? 0.55 : 0.45;
                    imageData = UIImageJPEGRepresentation(scaledImage, quality);
                }
            }else{
                if ((float)imageData.length/1024 > minByte) {
                    CGFloat quality =  screenHeight == 480 ? 0.55 : 0.45;
                    imageData = UIImageJPEGRepresentation(image, quality);
                }
            }
        }else{
            if (image.size.height > size.height) {
                CGFloat needScale = size.height / image.size.height;
                CGSize size = CGSizeMake(image.size.width * needScale, image.size.height * needScale);
                // 创建一个bitmap的context
                // 并把它设置成为当前正在使用的context
                UIGraphicsBeginImageContext(size);
                // 绘制改变大小的图片
                [image drawInRect:CGRectMake(0, 0,size.width, size.height)];
                // 从当前context中创建一个改变大小后的图片
                UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
                // 使当前的context出堆栈
                UIGraphicsEndImageContext();
                // 返回新的改变大小后的图片
                imageData = UIImageJPEGRepresentation(scaledImage, 1.0);
                if ((float)imageData.length/1024 > minByte) {
                    CGFloat quality =  screenHeight == 480 ? 0.55 : 0.45;
                    imageData = UIImageJPEGRepresentation(scaledImage, quality);
                }
            }else{
                if ((float)imageData.length/1024 > 85.0) {
                    CGFloat quality =  screenHeight == 480 ? 0.55 : 0.45;
                    imageData = UIImageJPEGRepresentation(image, quality);
                }
            }
        }
    }
    
    return imageData;
}

@end
