//
//  PersonInfoModel.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/11.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "PersonInfoModel.h"

@interface PersonInfoModel()

@property (nonatomic, strong) FMDatabase *database;

@end

@implementation PersonInfoModel

- (void)saveToDataBase {
    //路径
    NSString *path = [DocumentPath stringByAppendingPathComponent:@"MyDatabase"];
    //创建database
    FMDatabase *database = [[FMDatabase alloc] initWithPath:path];
    self.database = database;
    //打开
    if ([database open]) {
        NSLog(@"数据库打开成功：：：");
        NSLog(@"路径：%@",path);
    }else {
        NSLog(@"数据库打开失败：：：");
        return;
    }
    
    //建表
    NSString *createTableSql = @"CREATE TABLE IF NOT EXISTS Person (id integer PRIMARY KEY, name text NOT NULL, address text NOT NULL, phone text NOT NULL, age integer NOT NULL)";
    if ([database executeUpdate:createTableSql]) {
        NSLog(@"建表成功");
    }else {
        NSLog(@"建表失败");
        return;
    }
    
    //写入数据
    NSString *saveDataSql = @"INSERT INTO Person (name, address, phone, age) VALUES (?,?,?,?);";
    BOOL result = [database executeUpdate:saveDataSql,self.name,self.address,self.phone,@(self.age)];
    if (result) {
       NSLog(@"数据插入成功");
    }else {
        NSLog(@"数据插入失败");
        return;
    }
}

- (void)searchData {
    FMResultSet *set = [self.database executeQuery:@"SELECT * FROME Person"];
    int i = 0;
    while ([set next]) {
        NSLog(@"value:%@",[set stringForColumnIndex:i]);
        i = i + 1;
    }
}

@end
