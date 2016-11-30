//
//  MigrationManager.m
//  JTMeasure
//
//  Created by comv on 2016/10/24.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "MigrationManager.h"
#import "MigrationVersion1_0.h"
#import "MigrationVersion2_0.h"

@implementation MigrationManager

- (NSDictionary *)migrationStepDictionary {
    return @{
             @"1.0" : [MigrationVersion1_0 class],
             @"2.0" : [MigrationVersion2_0 class],
             };
}

- (NSArray *)migrationVersionList {
    return @[kCTPersistanceInitVersion, @"1.0", @"2.0"];
}

@end


