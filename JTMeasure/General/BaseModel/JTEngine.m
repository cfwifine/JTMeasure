//
//  JTEngine.m
//  JTMeasure
//
//  Created by 魏初芳 on 16/5/19.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "JTEngine.h"

@implementation JTEngine

+ (JTEngine *)cuttentEngine {
    return [[self alloc] init];
}

- (instancetype)init {
    if (self = [super init]) {
        self.user = [self currentUser];
    }
    return self;
}

- (void)dealloc {
    self.user = nil;
}

- (void)saveCurrentUser:(UserModel *)user {
    [ObjectUserDefaultUtil saveObject:user forKey:JTCurrentUser];
}

- (UserModel *)currentUser {
    return [ObjectUserDefaultUtil getObjectForKey:JTCurrentUser];
}

- (void)signOut {
    [ObjectUserDefaultUtil removeForKey:JTCurrentUser];
}

- (BOOL)isLogin {
    return [ObjectUserDefaultUtil getBoolForKey:JTCurrentUserIsLogin];
}

@end
