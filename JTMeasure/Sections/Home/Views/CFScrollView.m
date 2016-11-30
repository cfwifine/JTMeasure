//
//  CFScrollView.m
//  JTMeasure
//
//  Created by comv on 16/8/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "CFScrollView.h"
#import "CFScrollViewCell.h"

@interface CFScrollViewCell(SeletedResponser)

@end

@implementation CFScrollViewCell(SeletedResponser)

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor lightGrayColor];
    [self.nextResponder touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor whiteColor];
    UIResponder *nextResponder = self.nextResponder;
    [nextResponder.nextResponder touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor lightGrayColor];
}

@end




@interface CFScrollView()

@property (nonatomic, strong) UIView *subContaintView; //容器
@property (nonatomic, strong) NSMutableArray *visableCells;//可见的cell
@property (nonatomic, strong) NSMutableDictionary *reusableCells; //复用的cell

@end

@implementation CFScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)initData {
    _visableCells = [NSMutableArray array];
    _reusableCells = [NSMutableDictionary dictionary];
    self.contentSize = CGSizeMake(0, 8000);
}

- (void)initUI {
    _subContaintView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.contentSize.height)];
    [self addSubview:_subContaintView];
}

- (CFScrollViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier {
    NSAssert(identifier != nil, @"identifier cant not be nil");
    NSMutableArray *cells = [self.reusableCells objectForKey:identifier];
    if (cells.count <= 0) {
        return nil;
    }
    CFScrollViewCell *cell = [cells firstObject];
    return cell;
}

@end
