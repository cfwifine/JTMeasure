//
//  NetworkRequest.h
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/19.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkClient.h"

typedef void(^networkStatusChangeBlock)(NetworkStatus status);

@interface NetworkRequest : NSObject

+ (NetworkRequest *)sharedRequest;

/** 网络检测*/
- (AFNetworkReachabilityManager *)checkCurrentNetworkStatusWithDomain:(NSString *)domain
                                        reachabilityStatusChangeBlock:(networkStatusChangeBlock)block;

//此处统一处理整个项目的api接口

- (void)downloadFileDataRequestWithApath:(NSString *)aPath
                           compelteBlock:(void(^)(id data, NSURL *filePath))completeBlock;
@end
