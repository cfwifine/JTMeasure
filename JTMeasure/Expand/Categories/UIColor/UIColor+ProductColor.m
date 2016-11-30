//
//  UIColor+ProductColor.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/4/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UIColor+ProductColor.h"

@implementation UIColor (ProductColor)
/***************************项目颜色***************************/
+ (UIColor *)app_Glob_Navibar_Color{
    
    return [self colorWithHexString:@"0xc80b1a"];
}

+ (UIColor *)app_Glob_Tabbar_Color{
    return [self colorWithHexString:@"0xc80b1a"];
}

+ (UIColor *)app_Glob_ViewBackground_Color{
    return [self colorWithHexString:@"0xc80b1a"];
}

+ (UIColor *)app_Glob_ButtonNomal_Color{
    return [self colorWithHexString:@"0xc80b1a"];
}

+ (UIColor *)app_Glob_ButtonHightlight_Color{
    return [self colorWithHexString:@"0xc80b1a"];
}

+ (UIColor *)app_Glob_ButtonDisable_Color{
    return [self colorWithHexString:@"0xc80b1a"];
}

+ (UIColor *)app_Glob_Font_Color{
    return [self colorWithHexString:@"0xc80b1a"];
}

+ (UIColor *)app_Glob_Border_Color{
    return [self colorWithHexString:@"0xc80b1a"];
}

/***************************类方法***************************/
+ (UIColor *)colorWithHexString:(NSString *)color{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@end
