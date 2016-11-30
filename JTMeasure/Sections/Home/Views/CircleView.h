//
//  CircleView.h
//  JTMeasure
//
//  Created by comv on 16/8/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

@property (nonatomic, assign, readonly) CGFloat percent;

- (instancetype)initWithFrame:(CGRect)frame percent:(CGFloat)percent;

@end
