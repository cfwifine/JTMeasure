//
//  NSString+Operation.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/3.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Operation)

/**
 *  获取字符串(或汉字)首字母
 */
+ (NSString *)firstCharacterWithString:(NSString *)string;

/**
 *  将字符串数组按照元素首字母顺序进行排序分组
 */
+ (NSDictionary *)dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array;

@end
