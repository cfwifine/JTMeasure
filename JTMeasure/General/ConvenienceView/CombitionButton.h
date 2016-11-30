//
//  CombitionButton.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ImageInTextDirectionBottom, //图片在上
    ImageInTextDirectionLeft,   //图片在左
} ImageInTextDirection;

@interface CombitionButton : UIView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, assign) CGFloat horizonHeight;    //左右排布时高度

@property (nonatomic, assign) CGFloat verticalDistance; //上下排布时间距

@property (nonatomic, copy) void(^buttonClikedBlock)(UIButton *sender);

- (instancetype)initimageInTextDirection:(ImageInTextDirection)direction;

@end

