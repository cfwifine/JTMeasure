//
//  FoldManager.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/3.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoldManager : NSObject

/**
 *  沙盒总大小
 */
+ (CGFloat)diskOfAllSizeMBytes;

/**
 *  //沙盒可用空间
 */
+ (CGFloat)diskOfFreeSizeMBytes;

/**
 *  获取文件大小
 */
+ (long long)fileSizeAtPath:(NSString *)filePath;

/**
 *  获取文件夹下所有文件的大小
 */
+ (long long)folderSizeAtPath:(NSString *)folderPath;

@end
