//
//  BaseCell.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/5/16.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UITableViewCell

/** 根据tableView取出对应的Cell*/
+ (instancetype)cellWithTableView:(UITableView *)tableView
                            style:(UITableViewCellStyle)style
                       identifier:(NSString *)identifier
                            byXib:(BOOL)byXib;

/** 填充Cell的值*/
- (void)configCellDataWithData:(id)data;

@end
