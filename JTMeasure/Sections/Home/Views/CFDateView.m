//
//  CFDateView.m
//  JTMeasure
//
//  Created by comv on 16/8/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "CFDateView.h"

@interface CFDateView()
@property (nonatomic, strong) UIView *bgView;
@end

@implementation CFDateView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)initData {
    _scale = 1.0;
}

- (void)initUI {
    _bgView = [[UIView alloc] initWithFrame:CGRectZero];
    _bgView.backgroundColor = [UIColor clearColor];
    _bgView.layer.cornerRadius = self.bounds.size.width / 2.f;
    _bgView.layer.masksToBounds = YES;
    [self addSubview:_bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    _solarCalendarLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _solarCalendarLabel.textColor = [UIColor blackColor];
    _solarCalendarLabel.textAlignment = NSTextAlignmentCenter;
    _solarCalendarLabel.font = [UIFont systemFontOfSize:18.f];
    [_bgView addSubview:_solarCalendarLabel];
    [_solarCalendarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.equalTo(_bgView);
        make.height.height.equalTo(_bgView).multipliedBy(0.6);
    }];
    
    _lunarCalendarLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _lunarCalendarLabel.textColor = [UIColor blackColor];
    _lunarCalendarLabel.textAlignment = NSTextAlignmentCenter;
    _lunarCalendarLabel.font = [UIFont systemFontOfSize:14.f];
    [_bgView addSubview:_lunarCalendarLabel];
    [_lunarCalendarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.equalTo(_bgView);
        make.top.equalTo(_solarCalendarLabel.mas_bottom).offset(-10.f);
        make.height.height.equalTo(_bgView).multipliedBy(0.4);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _bgView.backgroundColor = [UIColor colorWithWhite:0.923 alpha:1.f];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _bgView.backgroundColor = [UIColor clearColor];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _bgView.backgroundColor = [UIColor clearColor];
}

- (void)configDate:(CFDateModel *)dateModel {
    _dateModel = dateModel;
    self.solarCalendarLabel.text = [@(dateModel.day) stringValue];
    self.lunarCalendarLabel.text = dateModel.lunarDay;
}



@end
