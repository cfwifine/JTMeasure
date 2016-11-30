//
//  SaveDataManager.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/11.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveDataManager : NSObject

+ (instancetype)sharedManager;

/** 数据库的路径*/
- (void)setDataBasePath:(NSString *)path;
/** 插入数据*/
- (void)inserWithModel:(NSObject *)model callBack:(void(^)(BOOL success))block;
/** 删除数据*/
- (void)deleteWithModel:(NSObject*)model callBack:(void (^)(BOOL success))block;
/** 修改数据*/
- (void)updateWithModel:(NSObject*)model where:(id)where callBack:(void (^)(BOOL success))block;
/** 查找数据*/
- (NSMutableArray*)searchWithClass:(Class)modelClass withSQL:(NSString*)sql, ...;
/** 数据是否已经存在*/
- (BOOL)isExistWithModel:(NSObject *)model;

@end
