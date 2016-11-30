//
//  BaseTextFiled.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/5/16.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "BaseTextFiled.h"

@implementation BaseTextFiled

+ (instancetype)defaultTextFiled {
    return [[self alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initDefaultUI];
    }
    return self;
}

- (void)initDefaultUI {
    self.backgroundColor = [UIColor whiteColor];
    self.borderStyle = UITextBorderStyleRoundedRect;
    self.textColor = [UIColor app_Glob_Font_Color];
}

@end
