//
//  UIImageView+WebImageCache.m
//  JTMeasure
//
//  Created by comv on 2016/9/29.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UIImageView+WebImageCache.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (WebImageCache)

/** 普通图片缓存*/
- (void)cacheImageForUrlString:(NSString *)urlString
              placeholderImage:(UIImage *)image
                     completed:(CacheCompleteBlock)completeBlock {
    NSAssert((urlString.length <= 0 || urlString != nil), @"urlString不能为空！");
    if (![self checkUrlIsAll:urlString]) {
        urlString = [@"" stringByAppendingString:urlString]; //拼接上前缀
    }
    [self sd_setImageWithURL:[NSURL URLWithString:urlString]
                 placeholderImage:image
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                            if (!error && completeBlock != nil) {
                                completeBlock(image, imageURL);
                            }else{
                                //此处处理错误
                                NSLog(@"图片缓存出错...");
                            }
                        }];
}

/** 带进度的图片缓存*/
- (void)cacheImageForUrlString:(NSString *)urlString
              placeholderImage:(UIImage *)image
              downloadProgress:(DownloadProgressBlock)downloadProgress
                     completed:(CacheCompleteBlock)completeBlock {
    NSAssert((urlString.length <= 0 || urlString != nil), @"urlString不能为空！");
    if (![self checkUrlIsAll:urlString]) {
        urlString = [@"" stringByAppendingString:urlString]; //拼接上前缀
    }
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:image options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        if (expectedSize > 0) {
            downloadProgress(receivedSize * 1.0 / expectedSize);
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!error && completeBlock != nil) {
            completeBlock(image, imageURL);
        }else{
            //此处处理错误
            NSLog(@"图片缓存出错...");
        }
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
