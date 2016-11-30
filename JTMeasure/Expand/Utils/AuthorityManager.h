//
//  AuthorityManager.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/6/22.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    AuthorityTypeLocation,    //位置
    AuthorityTypeCamara,      //相机
    AuthorityTypePhotos,      //相册
    AuthorityTypeMicrophonic, //麦克风
    AuthorityTypePush,        //推送
    AuthorityTypeAddressBook, //通讯录
    AuthorityTypeEvent,       //日历
    AuthorityTypeReminder,    //备忘录
}AuthorityType;

@interface AuthorityManager : NSObject

/**
 * 单例
 */
+ (instancetype)sharedAuthorityManager;

/**
 *  检测是否已经授权
 */
- (BOOL)hasAuthoritedWithType:(AuthorityType)type shouldAlert:(BOOL)alert;

/**
 * 请求授权
 */
- (BOOL)requestAuthoritedWithType:(AuthorityType)type;

@end
