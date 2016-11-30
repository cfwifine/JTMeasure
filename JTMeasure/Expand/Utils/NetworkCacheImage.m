//
//  NetworkCacheImage.m
//  YuanChenKeeper
//
//  Created by 魏初芳 on 16/4/5.
//  Copyright © 2016年 com.Qingye.YuanChenKeeper. All rights reserved.
//

#import "NetworkCacheImage.h"
#import <UIImageView+WebCache.h>
#import <SDWebImageManager.h>

#define CNDURL @"http://ycapp.oudewa.cn"

@implementation NetworkCacheImage

/**
 *  单例
 *
 *  @return 本类实例
 */
+ (NetworkCacheImage *)sharedNetworkCacheImage{
    static dispatch_once_t predicate;
    static NetworkCacheImage *shareInstance;
    _dispatch_once(&predicate, ^{
        shareInstance = [[NetworkCacheImage alloc] init];
    });
    return shareInstance;
}

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
                     completed:(CacheCompleteBlock)completeBlock{
    NSAssert((urlString.length <= 0 || urlString != nil), @"urlString不能为空！");
    if (![self checkUrlIsAll:urlString]) {
        urlString = [CNDURL stringByAppendingString:urlString];
    }
    [iamgeView sd_setImageWithURL:[NSURL URLWithString:urlString]
                 placeholderImage:image
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                            if (!error && completeBlock != nil) {
                                completeBlock(image, imageURL);
                            }else{
                                //此处处理错误
                            }
    }];
}

/**
 *  缓存图片
 *
 *  @param urlString        图片urlSting
 *  @param downloadProgress 缓存进度
 *  @param completeBlock    加载完成回调
 */
- (void)cacheImageForDownloadWithUrlString:(NSString *)urlString
                          downloadProgress:(DownloadProgressBlock)downloadProgress
                                 completed:(CacheCompleteBlock)completeBlock{
    NSAssert((urlString.length <= 0 || urlString != nil), @"urlString不能为空！");
    if (![self checkUrlIsAll:urlString]) {
        urlString = [CNDURL stringByAppendingString:urlString];
    }
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:urlString]
                                                    options:SDWebImageProgressiveDownload
                                                   progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        float progress = receivedSize * 1.0 / expectedSize;
        downloadProgress(progress);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        completeBlock(image, imageURL);
    }];
}

#pragma mark -- PrivateMethod
- (BOOL)checkUrlIsAll:(NSString *)urlString{
    if ([urlString hasPrefix:@"http://"]) {
        return YES;
    }
    return NO;
}

@end
