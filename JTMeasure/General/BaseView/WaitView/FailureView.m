//
//  FailureView.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/31.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "FailureView.h"
@interface FailureView()
@property (nonatomic,strong)UIImageView *failureImageView;
@property (nonatomic,strong)UIButton    *reloadButton;
@end

@implementation FailureView

- (BOOL)willDealloc {
    return NO;
}

+ (instancetype)sharedFailureView {
    static dispatch_once_t predicate;
    static FailureView *shareInstance = nil;
    dispatch_once(&predicate, ^{
        shareInstance = [[FailureView alloc] initWithFrame:CGRectZero];
    });
    return shareInstance;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)showFailureViewInView:(UIView *)view {
    if (view) {
        self.frame = view.bounds;
        [view addSubview:self];
    }else {
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    }
}

- (void)hideFilureViewFromeView {
    [self removeFromSuperview];
}

- (void)initUI {
    self.failureImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.failureImageView.image = self.failureImage;
    [self addSubview:self.failureImageView];
//    NSCalendar
    
    self.reloadButton = [[UIButton alloc] init];
    [self.reloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
    [self.reloadButton addTarget:self action:@selector(reloadButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.reloadButton];
    
    [self.failureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_centerY);
        make.width.equalTo(self).multipliedBy(3/4);
        make.height.equalTo(self.failureImageView.mas_width);
        make.centerX.equalTo(self);
    }];
    
    [self.reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.centerX.equalTo(self);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        make.height.equalTo(35);
    }];
}

- (void)reloadButtonCliked:(UIButton *)sender {
    if (_reloadButtonClikedBlock) {
        _reloadButtonClikedBlock(sender);
    }
}

#pragma Setter
- (void)setFailureImage:(UIImage *)failureImage {
    _failureImage = failureImage;
    self.failureImageView.image = failureImage;
}


@end
