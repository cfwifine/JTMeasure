//
//  UIImageView+WebImageCache.h
//  JTMeasure
//
//  Created by comv on 2016/9/29.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CacheCompleteBlock)(UIImage *image, NSURL *imageUrl);
typedef void(^DownloadProgressBlock)(float progress);

@interface UIImageView (WebImageCache)

/** 普通图片缓存*/
- (void)cacheImageForUrlString:(NSString *)urlString
              placeholderImage:(UIImage *)image
                     completed:(CacheCompleteBlock)completeBlock;

/** 带进度的图片缓存*/
- (void)cacheImageForUrlString:(NSString *)urlString
              placeholderImage:(UIImage *)image
              downloadProgress:(DownloadProgressBlock)downloadProgress
                     completed:(CacheCompleteBlock)completeBlock;

@end
