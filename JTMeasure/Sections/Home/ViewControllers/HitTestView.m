//
//  HitTestView.m
//  JTMeasure
//
//  Created by comv on 2016/10/26.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "HitTestView.h"

@implementation HitTestView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

- (void)initUI {
//    UIView *purpleView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
//    purpleView.backgroundColor = [UIColor purpleColor];
//    purpleView.clipsToBounds = NO;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, -30, 50, 50)];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    button.tag = 101;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];

}

- (void)buttonClicked:(UIButton *)sender {
    NSLog(@"按钮点击...");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIButton *button = [self viewWithTag:101];
    if (CGRectContainsPoint(button.frame, point)) {
        return button;
    }else if (CGRectContainsPoint(self.bounds, point)) {
        return self;
    }else {
        return nil;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"view 点击。。。");
}


@end
