//
//  TestModel.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

- (instancetype)initWithName:(NSString *)name phone:(NSString *)phone {
    if (self = [super init]) {
        _name = name;
        _phone = phone;
    }
    return self;
}

- (void)printInfo {
    NSLog(@"name:%@,phone:%@",_name,_phone);
}

@end
