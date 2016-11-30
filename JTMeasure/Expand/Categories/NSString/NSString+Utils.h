//
//  NSString+Utils.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/26.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Utils)

/** 字典转json字符串*/
+ (NSString *)dictionaryToJsonString:(NSDictionary *)dict;

/** 数组转json字符串*/
+ (NSString *)arrayToJsonString:(NSArray *)array;

/** 是否含有中文*/
+ (BOOL)isHaveChineseInString:(NSString *)string;

/** 是否全部是数字*/
+ (BOOL)isAllNum:(NSString *)string;

/** 是否含有空格*/
+ (BOOL)isHaveSpaceInString:(NSString *)string;

/** 是否为空*/
+ (BOOL)isEmpty:(NSString *)string;

/** 字符个数*/
+ (int)charNumber:(NSString *)string;

/** 字符串是否含有子字符串*/
+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2;

/** 替换字符串*/
- (NSString *)stringByReplacingStringsFromDictionary:(NSDictionary *)dict;

/** 去掉左右两边空格*/
- (NSString *)removeLeadingTrallingSpace;

/*************************************************/
/** 动态计算文本高度*/
- (float)heightWithFontSize:(float)fontSize maxWidth:(float)width;

@end
