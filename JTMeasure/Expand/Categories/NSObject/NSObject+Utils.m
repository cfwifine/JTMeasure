//
//  NSObject+Utils.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/26.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "NSObject+Utils.h"

@implementation NSObject (Utils)

-(NSString *)address{
    return [NSString stringWithFormat:@"%p",self];
}

- (BOOL)isErrorData {
    if (self) {
        return [self isKindOfClass:[NSError class]];
    }
    return NO;
}

@end
