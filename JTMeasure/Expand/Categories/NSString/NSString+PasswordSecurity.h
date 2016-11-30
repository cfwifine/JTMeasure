//
//  NSString+PasswordSecurity.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/4/28.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PasswordSecurity)

/** 32位MD5加密*/
@property (nonatomic,copy,readonly) NSString *md5;

/** SHA1加密*/
@property (nonatomic,copy,readonly) NSString *sha1;

@end
