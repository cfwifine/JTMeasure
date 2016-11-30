//
//  SaveDataManager.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/11.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "SaveDataManager.h"
#import <LKDBHelper.h>

@interface SaveDataManager()

@property (nonatomic, strong) LKDBHelper *helper;

@end

@implementation SaveDataManager

+ (instancetype)sharedManager {
    static dispatch_once_t predicate;
    static id sharedInstance = nil;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _helper = [[LKDBHelper alloc] initWithDBPath:[self getDataBasePath]];
    }
    return self;
}
/** 数据库的路径*/
- (void)setDataBasePath:(NSString *)path {
    NSAssert(path && path.length > 0, @"数据库路径不能为空");
    [self.helper setDBPath:path];
}

/** 插入数据*/
- (void)inserWithModel:(NSObject *)model callBack:(void(^)(BOOL success))block {
    NSAssert(model, @"插入的Model不能为空");
    [self.helper insertToDB:model callback:block];
}
/** 删除数据*/
- (void)deleteWithModel:(NSObject*)model callBack:(void (^)(BOOL success))block {
    NSAssert(model, @"删除的Model不能为空");
    [self.helper deleteToDB:model callback:block];
}
/** 修改数据*/
- (void)updateWithModel:(NSObject*)model where:(id)where callBack:(void (^)(BOOL success))block {
    NSAssert(model, @"修改的Model不能为空");
    [self.helper updateToDB:model where:where callback:block];
}
/** 查找数据*/
- (NSMutableArray*)searchWithClass:(Class)modelClass withSQL:(NSString*)sql, ... {
    NSAssert(modelClass, @"查找的ModelClass不能为空");
    [self.helper search:modelClass withSQL:sql];
    return nil;
}
/** 数据是否已经存在*/
- (BOOL)isExistWithModel:(NSObject *)model {
    NSAssert(model, @"Model不能为空");
    return [self.helper isExistsModel:model];
}

#pragma mark -- PrivateMethod
- (NSString *)getDataBasePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    NSString *helperDBPath = [documentsDirectory stringByAppendingString:@"/helperDB"];
    NSString *filePath = [helperDBPath stringByAppendingString:@"/AppDB.db"];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSLog(@"filePath:%@",filePath);
    if ([fm fileExistsAtPath:filePath]) {
        return filePath;
    }
    BOOL success = [fm createDirectoryAtPath:helperDBPath withIntermediateDirectories:YES attributes:nil error:nil];
    if (success) {
        [fm createFileAtPath:filePath contents:nil attributes:nil];
    }
    return filePath;
}

@end
