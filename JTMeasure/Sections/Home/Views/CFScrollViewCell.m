//
//  CFScrollViewCell.m
//  JTMeasure
//
//  Created by comv on 16/8/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "CFScrollViewCell.h"
#import "CFCellDateModel.h"
#import "CFDateView.h"
#import "CFDateModel.h"

@implementation CFScrollViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame identifier:(NSString *)identifier {
    _identifier = identifier;
    return [self initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
}

- (void)configScrollViewCellData:(CFCellDateModel *)cellDateModel {
    //根据每个月的数据模型来创建子视图
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    monthLabel.text = [NSString stringWithFormat:@"%d月",cellDateModel.month];
    monthLabel.textAlignment = NSTextAlignmentCenter;
    monthLabel.textColor = [UIColor redColor];
    [self addSubview:monthLabel];
    CGFloat width = (CGRectGetWidth(self.frame) - 20.f) / 7.f;
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(width, 30.f));
        make.top.equalTo(5.f);
        make.leading.equalTo(10.f + (cellDateModel.beginWeekDay - 1) * width);
    }];
    
    for (int i = 0; i < cellDateModel.dateModels.count; i ++) {
        CFDateModel *dateModel = [cellDateModel.dateModels objectAtIndex:i];
        
        int column = dateModel.weekDay;
        int row = (i + cellDateModel.drawDayBeginIndex) / 7.f;
        
        CFDateView *dateView = [[CFDateView alloc] initWithFrame:CGRectMake(column * width + 10.f,
                                                                            row * (width + 15.f) +5+30+5,
                                                                            width,
                                                                            width)];
        [dateView configDate:dateModel];
        [self addSubview:dateView];
        
        
    }
}

@end
