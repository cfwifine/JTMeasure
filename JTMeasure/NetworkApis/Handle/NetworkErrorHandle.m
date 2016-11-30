//
//  NetworkErrorHandle.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/7.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "NetworkErrorHandle.h"
#import "ProgressHUDHandler.h"

@implementation NetworkErrorHandle

+ (NSString *)handleResponseError:(NSError *)error{
    if (error && error.userInfo) {
        NSMutableString *tipStr = [[NSMutableString alloc] init];
        if (error.userInfo[@"codeInfo"]) {
            [tipStr appendString:error.userInfo[@"codeInfo"]];
        }else{
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            }else{
                [tipStr appendFormat:@"ErrorCode = %ld", (long)error.code];
            }
        }
        [ProgressHUDHandler showSVErrorTipStr:tipStr];
        return tipStr;

    }
    return nil;
}

@end
