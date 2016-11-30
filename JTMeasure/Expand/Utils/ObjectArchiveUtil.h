//
//  ObjectArchiveUtil.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/15.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <Foundation/Foundation.h>

//***************************归档************************//
@interface ObjectArchiveUtil : NSObject

/** 把数据归档*/
+ (void)archiveDataWith:(id)originData key:(NSString *)key;

/** 把数据归档到指定的文件路径*/
+ (void)archiveDataWith:(id)originData toFilePath:(NSString *)path;

/** 从UserDefaults解归档*/
+ (id)unarchiveDataWithKey:(NSString *)key;

/** 从文件中解归档*/
+ (id)unarchiveDataWithFilePath:(NSString *)filePath;

@end

//************************保存到UserDefult*******************//
@interface ObjectUserDefaultUtil : NSObject

/** 对象保存*/
+ (void)saveObject:(id)objectData forKey:(NSString *)objectKey;

/** bool值保存*/
+ (void)saveBool:(BOOL)boolData forKey:(NSString *)boolKey;

/** integer值保存*/
+ (void)saveInteger:(NSInteger)integerData forKey:(NSString *)integerKey;

/** 对象获取*/
+ (id)getObjectForKey:(NSString *)objectKey;

/** bool值获取*/
+ (BOOL)getBoolForKey:(NSString *)boolKey;

/** integer值获取*/
+ (NSInteger)getIntegerForKey:(NSString *)integerKey;

/** 删除指定的值*/
+ (void)removeForKey:(NSString *)integerKey;

@end
