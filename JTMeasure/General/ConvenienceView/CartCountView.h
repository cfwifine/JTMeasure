//
//  CartCountView.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartCountView : UIView

@property (nonatomic, assign) NSInteger count; //数量

@property (nonatomic, strong) UIImage *downImage; //减图片

@property (nonatomic, strong) UIImage *upImage; //加图片

@end
