//
//  NSObject+Utils.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/4/26.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Utils)

/**返回任意对象字符串地址*/
-(NSString *)address;

/**判断对象是否是Error类型*/
- (BOOL)isErrorData;

@end
