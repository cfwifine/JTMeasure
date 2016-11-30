//
//  BaseCell.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/5/16.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
                            style:(UITableViewCellStyle)style
                       identifier:(NSString *)identifier
                            byXib:(BOOL)byXib{
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell && !byXib) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:identifier];
    }else if (!cell && byXib) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class)
                                              owner:nil
                                            options:nil]
                lastObject];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)configCellDataWithData:(id)data {
    //子类重写
}


@end
