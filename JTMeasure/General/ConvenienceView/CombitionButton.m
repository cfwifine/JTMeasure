//
//  CombitionButton.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "CombitionButton.h"

@interface CombitionButton()

@property (nonatomic, strong) UIButton *clearButton;

@property (nonatomic, assign) ImageInTextDirection direction;

@end

@implementation CombitionButton

- (instancetype)initimageInTextDirection:(ImageInTextDirection)direction {
    _direction = direction;
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    [self addSubview:_titleLabel];
    
    _imageView = [[UIImageView alloc] init];
    _imageView.image = [UIImage imageNamed:@"video_preview_play_highlight"];
    [self addSubview:_imageView];
    
    _clearButton = [[UIButton alloc] init];
    _clearButton.backgroundColor = [UIColor clearColor];
    [_clearButton addTarget:self action:@selector(clearButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_clearButton];

    if (self.direction == ImageInTextDirectionBottom) {
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.centerX.equalTo(self);
            make.width.equalTo(self);
            make.height.equalTo(20);
        }];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.centerX.equalTo(self);
            make.bottom.equalTo(_titleLabel.mas_top).offset(-10);
            make.width.equalTo(_imageView.height);
        }];
        
        [_clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }else if (self.direction == ImageInTextDirectionLeft) {
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView.mas_right).offset(5);
            make.right.equalTo(self);
            make.centerY.equalTo(self);
            make.height.equalTo(self).multipliedBy(0.5);
        }];
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(_titleLabel.mas_left).offset(-5);
            make.centerY.equalTo(self);
            make.height.and.width.equalTo(self.mas_height).multipliedBy(0.5);
        }];
        
        [_clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }

}

- (void)clearButtonCliked:(UIButton *)sender {
    if (_buttonClikedBlock) {
        _buttonClikedBlock(sender);
    }
}

#pragma mark -- Setter/Getter
- (void)setHorizonHeight:(CGFloat)horizonHeight {
    _horizonHeight = horizonHeight;
    
    [_titleLabel updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView.mas_right).offset(5);
        make.right.equalTo(self);
        make.centerY.equalTo(self);
        make.height.equalTo(horizonHeight);
    }];
    
    [_imageView updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(_titleLabel.mas_left).offset(-5);
        make.centerY.equalTo(self);
        make.height.and.width.equalTo(horizonHeight);
    }];

}

- (void)setVerticalDistance:(CGFloat)verticalDistance {
    _verticalDistance = verticalDistance;
    
    [_titleLabel updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(15);
    }];
    
    [_imageView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.centerX.equalTo(self);
        make.bottom.equalTo(_titleLabel.mas_top).offset(-verticalDistance);
        make.width.equalTo(_imageView.height);
    }];
}

@end
