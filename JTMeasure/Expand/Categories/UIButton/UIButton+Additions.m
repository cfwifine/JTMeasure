//
//  UIButton+Additions.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/2/27.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "UIButton+Additions.h"

@implementation UIButton (Additions)

- (void)setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType {
    
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11]}];
    [self.imageView setContentMode:UIViewContentModeCenter];
    [self setImageEdgeInsets:UIEdgeInsetsMake(-titleSize.height,
                                              0.0,
                                              0.0,
                                              -titleSize.width)];
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor] ];
    [self.titleLabel setFont:[UIFont systemFontOfSize:11.0] ];
    [self.titleLabel setTextColor:[UIColor blackColor] ];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(image.size.height - titleSize.height ,
                                              -image.size.width,
                                              0.0,
                                              0.0)];
    [self setTitle:title forState:stateType];
    
    float sw = 20 / image.size.width;
    float sh = 20 / image.size.height;
    self.imageView.transform = CGAffineTransformMakeScale(sw,sh);
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
