//
//  CartCountView.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "CartCountView.h"

@interface CartCountView()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *downButton;

@property (nonatomic, strong) UIButton *upButton;

@property (nonatomic, strong) UITextField *countTextFiled;

@property (nonatomic, assign) NSInteger currentCount;

@end

@implementation CartCountView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _downButton = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                             0,
                                                             CGRectGetHeight(self.frame),
                                                             CGRectGetHeight(self.frame))];
    [_downButton setBackgroundImage:[UIImage imageNamed:@"video_preview_play_highlight"] forState:UIControlStateNormal];
    [_downButton addTarget:self action:@selector(downButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_downButton];
    
    _upButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) - CGRectGetHeight(self.frame),
                                                           0,
                                                           CGRectGetHeight(self.frame),
                                                           CGRectGetHeight(self.frame))];
    [_upButton setBackgroundImage:[UIImage imageNamed:@"video_preview_play_highlight"] forState:UIControlStateNormal];
    [_upButton addTarget:self action:@selector(upButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_upButton];
    
    _countTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetHeight(self.frame),
                                                                    0,
                                                                    CGRectGetWidth(self.frame) - CGRectGetHeight(self.frame) * 2,
                                                                    CGRectGetHeight(self.frame))];
    _countTextFiled.borderStyle = UITextBorderStyleNone;
    _countTextFiled.textAlignment = NSTextAlignmentCenter;
    _countTextFiled.delegate = self;
    _currentCount = 1;
    _countTextFiled.text = [@(_currentCount) stringValue];
    [self addSubview:_countTextFiled];
}

- (void)downButtonCliked:(UIButton *)sender {
    if (self.currentCount <= 1) {
        sender.enabled = NO;
        return;
    }
    self.currentCount -= 1;
    self.countTextFiled.text = [@(self.currentCount) stringValue];
}

- (void)upButtonCliked:(UIButton *)sender {
    if (self.currentCount >= 1) {
        self.downButton.enabled = YES;
    }
    
    self.currentCount += 1;
    self.countTextFiled.text = [@(self.currentCount) stringValue];
    
}

#pragma mark -- UITextFiledDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text integerValue] <= 0 || textField.text.length <= 0) {
        textField.text = [@1 stringValue];
    }
}

#pragma mark -- Getter/Setter
- (NSInteger)count {
    return [self.countTextFiled.text integerValue];
}

- (void)setDownImage:(UIImage *)downImage {
    _downImage = downImage;
    [self.downButton setBackgroundImage:downImage forState:UIControlStateNormal];
}

- (void)setUpImage:(UIImage *)upImage {
    _upImage = upImage;
    [self.upButton setBackgroundImage:upImage forState:UIControlStateNormal];
}



@end
