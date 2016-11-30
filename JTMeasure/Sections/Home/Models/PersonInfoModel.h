//
//  PersonInfoModel.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/11.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "BaseModel.h"

@interface PersonInfoModel : BaseModel

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *phone;

@property (nonatomic, assign) NSInteger age;

- (void)saveToDataBase;

- (void)searchData;

@end
