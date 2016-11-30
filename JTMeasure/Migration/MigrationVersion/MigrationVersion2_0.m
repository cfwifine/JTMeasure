//
//  MigrationVersion2_0.m
//  JTMeasure
//
//  Created by comv on 2016/10/24.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "MigrationVersion2_0.h"

@implementation MigrationVersion2_0

- (void)goUpWithQueryCommand:(CTPersistanceQueryCommand *)queryCommand error:(NSError **)error {
    NSLog(@"升级...");
}

- (void)goDownWithQueryCommand:(CTPersistanceQueryCommand *)queryCommand error:(NSError *__autoreleasing *)error {
    NSLog(@"降级...");
}

@end
