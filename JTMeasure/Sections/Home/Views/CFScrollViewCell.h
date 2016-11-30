//
//  CFScrollViewCell.h
//  JTMeasure
//
//  Created by comv on 16/8/30.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CFCellDateModel;
@interface CFScrollViewCell : UIView

//复用的标识
@property (nonatomic, strong) NSString *identifier;

//初始化
- (instancetype)initWithFrame:(CGRect)frame identifier:(NSString *)identifier;
//填充数据
- (void)configScrollViewCellData:(CFCellDateModel *)cellDateModel;

@end
