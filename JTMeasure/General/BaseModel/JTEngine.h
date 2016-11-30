//
//  JTEngine.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/19.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

#define JTCurrentUser        @"JTCurrentUser"
#define JTCurrentUserIsLogin @"JTCurrentUserIsLogin"

@interface JTEngine : NSObject

/** 用户信息*/
@property (nonatomic, strong) UserModel *user;

/** 当前引擎*/
+ (JTEngine *)cuttentEngine;

/** 保存用户信息*/
- (void)saveCurrentUser:(UserModel *)user;

/** 获取用户信息*/
- (UserModel *)currentUser;

/** 退出*/
- (void)signOut;

/** 是否登录*/
- (BOOL)isLogin;

@end
