//
//  Person.h
//  JTMeasure
//
//  Created by comv on 2016/10/24.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <CTPersistance/CTPersistance.h>

@interface Person : CTPersistanceRecord

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, copy) NSString *sex;

@end
