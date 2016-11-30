//
//  NetworkErrorHandle.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/7.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkErrorHandle : NSObject

+ (NSString *)handleResponseError:(NSError *)error;

@end

