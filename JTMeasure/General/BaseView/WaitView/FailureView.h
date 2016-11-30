//
//  FailureView.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/31.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FailureView : UIView

@property (nonatomic, strong) UIImage *failureImage;

+ (instancetype)sharedFailureView;

- (void)showFailureViewInView:(UIView *)view;

- (void)hideFilureViewFromeView;

@property (nonatomic, copy) void(^reloadButtonClikedBlock)(UIButton *sender);


@end
