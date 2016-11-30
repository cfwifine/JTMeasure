//
//  NetworkCacheImage.h
//  YuanChenKeeper
//
//  Created by 魏初芳 on 16/4/5.
//  Copyright © 2016年 com.Qingye.YuanChenKeeper. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CacheCompleteBlock)(UIImage *image, NSURL *imageUrl);
typedef void(^DownloadProgressBlock)(float progress);

@interface NetworkCacheImage : NSObject

/**
 *  单例
 *
 *  @return 本类实例
 */
+ (NetworkCacheImage *)sharedNetworkCacheImage;

/**
 *  iamgeView异步加载图片
 *
 *  @param iamgeView          控件imageview
 *  @param urlString          图片urlSting
 *  @param placeholderImage   holdImage
 *  @param completeBlock      加载完成回调
 */
- (void)cacheImageForImageView:(UIImageView *)iamgeView
                     urlString:(NSString *)urlString
              placeholderImage:(UIImage *)image
                     completed:(CacheCompleteBlock)completeBlock;

/**
 *  缓存图片
 *
 *  @param urlString        图片urlSting
 *  @param downloadProgress 缓存进度
 *  @param completeBlock    加载完成回调
 */
- (void)cacheImageForDownloadWithUrlString:(NSString *)urlString
                          downloadProgress:(DownloadProgressBlock)downloadProgress
                                 completed:(CacheCompleteBlock)completeBlock;

@end
