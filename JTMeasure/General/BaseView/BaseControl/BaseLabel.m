//
//  BaseLabel.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/5/16.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "BaseLabel.h"

@implementation BaseLabel

+ (instancetype)defaultLabel {
    return [[self alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self defaultInitUI];
    }
    return self;
}

- (void)defaultInitUI{
    self.backgroundColor = [UIColor clearColor];
    self.textAlignment = NSTextAlignmentLeft;
    self.textColor = [UIColor app_Glob_Font_Color];
    self.font = [UIFont systemFontOfSize:14];
}

@end
