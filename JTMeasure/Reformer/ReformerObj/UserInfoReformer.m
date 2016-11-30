//
//  UserInfoReformer.m
//  JTMeasure
//
//  Created by comv on 2016/10/25.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UserInfoReformer.h"

@implementation UserInfoReformer

- (NSDictionary *)reformerDataWithRowData:(NSDictionary *)rowData filterCondition:(NSDictionary *)condition {
    NSMutableDictionary *logicData = [NSMutableDictionary dictionary];
    //处理显示的逻辑
    NSString *description = [self oprationNullValue:rowData[@"data"][0][@"description"]];
    NSString *uid = [self oprationNullValue:rowData[@"data"][0][@"id"]];
    NSString *status = [self oprationNullValue:rowData[@"data"][0][@"status"]];
    [logicData setObject:description forKey:@"description"];
    [logicData setObject:uid forKey:@"id"];
    [logicData setObject:status forKey:@"status"];
    return logicData;
}

- (NSString *)oprationNullValue:(NSString *)value {
    if (value == nil && value.length <= 0) {
        return @"";
    }
    return value;
}

@end
