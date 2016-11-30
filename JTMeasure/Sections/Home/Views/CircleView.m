//
//  CircleView.m
//  JTMeasure
//
//  Created by comv on 16/8/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "CircleView.h"

@interface CircleView()

@property (nonatomic, strong) UIBezierPath *bgBezierPath;

@property (nonatomic, strong) UIBezierPath *valueBezierPath;

@property (nonatomic, strong) UILabel *percentLabel;

@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame percent:(CGFloat)percent {
    _percent = percent;
    return [self initWithFrame:frame];
}

- (void)drawRect:(CGRect)rect {
    _bgBezierPath = [UIBezierPath bezierPath];
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    [_bgBezierPath addArcWithCenter:center radius:self.bounds.size.width / 2 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [_bgBezierPath stroke];
    CAShapeLayer *bgCircleLayer = [CAShapeLayer layer];
    bgCircleLayer.bounds = self.bounds;
    bgCircleLayer.position = center;
    bgCircleLayer.path = _bgBezierPath.CGPath;
    bgCircleLayer.lineWidth = 5.0;
    bgCircleLayer.strokeColor = [UIColor grayColor].CGColor;
    bgCircleLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:bgCircleLayer];
    
    CGFloat endAngle = self.percent * M_PI * 2;
    _valueBezierPath = [UIBezierPath bezierPath];
    [_valueBezierPath addArcWithCenter:center radius:self.bounds.size.width / 2 startAngle:M_PI / 2 endAngle:endAngle + M_PI / 2 clockwise:YES];
    [_valueBezierPath stroke];
    CAShapeLayer *valueLayer = [CAShapeLayer layer];
    valueLayer.bounds = self.bounds;
    valueLayer.position = center;
    valueLayer.path = _valueBezierPath.CGPath;
    valueLayer.lineWidth = 5.0;
    valueLayer.strokeColor = [UIColor purpleColor].CGColor;
    valueLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:valueLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.1;//设置绘制动画持续的时间
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = NO;//是否翻转绘制
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.repeatCount = 1;
    [valueLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
    valueLayer.strokeEnd = 1.0;
}

- (void)initUI {
    _percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.bounds.size.height - 20) / 2, self.bounds.size.width, 20)];
    _percentLabel.text = @"8次";
    _percentLabel.textColor = [UIColor greenColor];
    _percentLabel.font = [UIFont systemFontOfSize:14];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_percentLabel];
}

@end
