//
//  ObjectArchiveUtil.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/15.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "ObjectArchiveUtil.h"

//***************************归档************************//
@implementation ObjectArchiveUtil

+ (void)archiveDataWith:(id)originData key:(NSString *)key {
    if (key == nil || key.length <= 0) return;
    if ([originData isKindOfClass:[NSData class]]) {
        if (originData != nil) {
            [ObjectArchiveUtil saveToUserDefaultsWithData:originData ForKey:key];
        }
    }else {
        NSData *targetData = [NSKeyedArchiver archivedDataWithRootObject:originData];
        if (targetData != nil) {
            [self saveToUserDefaultsWithData:targetData ForKey:key];
        }
    }
}

+ (void)archiveDataWith:(id)originData toFilePath:(NSString *)path {
    if (path == nil || path.length <= 0) return;
    path = [ObjectArchiveUtil checkFilePathValidat:path];
    if ([originData isKindOfClass:[NSData class]]) {
        if (originData != nil) {
            [self archiveDataWith:originData toFilePath:path];
        }
    }else {
        BOOL isSuccess = [NSKeyedArchiver archiveRootObject:originData toFile:path];
        if (!isSuccess) {
            DebugLog(@"归档到指定文件失败");
        }
    }
}

+ (id)unarchiveDataWithKey:(NSString *)key{
    if (key == nil || key.length <= 0) return nil;
    NSData *targetData = [ObjectArchiveUtil readDataFromDefaultsWithKey:key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:targetData];
}

+ (id)unarchiveDataWithFilePath:(NSString *)filePath {
    if (filePath == nil || filePath.length <= 0) return nil;
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

//检查文件路径是否有效,如果无效，则根据该路径重新创建
+ (NSString *)checkFilePathValidat:(NSString *)filePath {
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:filePath]) {
        BOOL isSuccess = [fm createFileAtPath:filePath contents:nil attributes:nil];
        return isSuccess ? filePath : nil;
    }else {
        return filePath;
    }
}

//保存到UserDefaults
+ (void)saveToUserDefaultsWithData:(NSData *)savedData ForKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:savedData forKey:key];
    [defaults synchronize];
}

//从UserDefaults读取
+ (id)readDataFromDefaultsWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

@end




//********************UserDefaults********************//
@implementation ObjectUserDefaultUtil

+ (void)saveObject:(id)objectData forKey:(NSString *)objectKey {
    if (objectData == nil || objectKey == nil) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([objectData isKindOfClass:[NSData class]]) {
        [defaults setObject:objectData forKey:objectKey];
    }else {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:objectData];
        if (data) {
            [defaults setObject:objectData forKey:objectKey];
        }
    }
    [defaults synchronize];
}

+ (void)saveBool:(BOOL)boolData forKey:(NSString *)boolKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:boolData forKey:boolKey];
    [defaults synchronize];
}

+ (void)saveInteger:(NSInteger)integerData forKey:(NSString *)integerKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:integerData forKey:integerKey];
    [defaults synchronize];
}

+ (id)getObjectForKey:(NSString *)objectKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:objectKey];
    if (data) {
        id model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        return model;
    }
    return nil;
}

+ (BOOL)getBoolForKey:(NSString *)boolKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:boolKey];
}

+ (NSInteger)getIntegerForKey:(NSString *)integerKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:integerKey];
}

+ (void)removeForKey:(NSString *)integerKey {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:integerKey];
}

@end
