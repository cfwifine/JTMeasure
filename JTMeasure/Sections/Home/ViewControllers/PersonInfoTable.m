//
//  PersonInfoTable.m
//  JTMeasure
//
//  Created by comv on 2016/10/24.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "PersonInfoTable.h"
#import "Person.h"

@implementation PersonInfoTable

- (NSString *)databaseName {
    //打印出library地址
    NSArray *libsPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libPath = [libsPath objectAtIndex:0];
    NSLog(@"libPath:%@",libPath);
    return @"/UserInfo/PersonInfoDatabase.sqlite";
}

- (NSString *)tableName {
    return @"PersonInfoTable";
}

- (NSDictionary *)columnInfo {
    return @{@"uid" : @"",
             @"name" : @"",
             @"address" : @"",
             @"age" : @"",
             @"sex" : @""
             };
}

- (Class)recordClass {
    return [Person class];
}

- (NSString *)primaryKeyName {
    return @"uid";
}

@end
