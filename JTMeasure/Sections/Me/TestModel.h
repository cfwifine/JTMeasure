//
//  TestModel.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PrintInfoDelegate <NSObject>

- (void)printInfo;

@end

@interface TestModel : NSObject<PrintInfoDelegate>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *phone;

- (instancetype)initWithName:(NSString *)name phone:(NSString *)phone;

@end
