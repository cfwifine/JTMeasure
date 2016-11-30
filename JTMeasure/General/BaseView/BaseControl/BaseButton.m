//
//  BaseButton.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/5/16.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton

+ (instancetype)defaultButton {
    return [[self alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initDefaultUI];
    }
    return self;
}

- (void)initDefaultUI {
    [self setBackgroundColor:[UIColor app_Glob_ButtonNomal_Color]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self borderRadius:3.0];
}

@end
