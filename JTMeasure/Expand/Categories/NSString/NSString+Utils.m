//
//  NSString+Utils.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/26.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

//字典转成json
+ (NSString *)dictionaryToJsonString:(NSDictionary *)dict {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&parseError];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableString *tempString = [NSMutableString stringWithString:jsonStr];
    NSString *attachString = [tempString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    return attachString;
}

//数组转成json
+ (NSString *)arrayToJsonString:(NSArray *)array {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:&parseError];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableString *tempString = [NSMutableString stringWithString:jsonStr];
    NSString *attachString = [tempString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    return attachString;
}

//是否含有中文
+ (BOOL)isHaveChineseInString:(NSString *)string{
    for(NSInteger i = 0; i < [string length]; i++){
        int a = [string characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

//是否全部是数字
+ (BOOL)isAllNum:(NSString *)string{
    unichar c;
    for (int i=0; i<string.length; i++) {
        c=[string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}

//是否含有空格
+ (BOOL)isHaveSpaceInString:(NSString *)string{
    NSRange _range = [string rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        return YES;
    }else {
        return NO;
    }
}

//是否为空
+ (BOOL)isEmpty:(NSString *)string {
    if ([string length] <= 0 || string == (id)[NSNull null] || string == nil) {
        return YES;
    }
    return NO;
}

//字符个数
+ (int)charNumber:(NSString *)string{
    int strlength = 0;
    char* p = (char*)[string cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0; i<[string lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}

//是否包含指定字符串
+ (BOOL)isHaveString:(NSString *)string1 InString:(NSString *)string2{
    NSRange _range = [string2 rangeOfString:string1];
    if (_range.location != NSNotFound) {
        return YES;
    }else {
        return NO;
    }
}

//替换掉指定的字符
- (NSString*)stringByReplacingStringsFromDictionary:(NSDictionary*)dict {
    NSMutableString* string = [self mutableCopy];
    for (NSString* target in dict) {
        [string replaceOccurrencesOfString:target withString:[dict objectForKey:target] options:0 range:NSMakeRange(0, [string length])];
    }
    return string;
}

//去掉左右两边空格
- (NSString *)removeLeadingTrallingSpace{
    NSString *result = self;
    result = [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return result;
    
}

/** 动态计算文本高度*/
- (float)heightWithFontSize:(float)fontSize maxWidth:(float)width {
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                           options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                           context:nil];
    return rect.size.height;
}




@end
