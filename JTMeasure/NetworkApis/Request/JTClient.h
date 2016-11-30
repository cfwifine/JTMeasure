//
//  JTClient.h
//  JTMeasure
//
//  Created by comv on 2016/10/25.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReformerProtocol.h"


@interface JTClient : NSObject

+ (instancetype)sharedManager;

- (void)cancelRequest;

- (NSDictionary *)fetchDataWithReformer:(id<ReformerProtocol>)reformer withCondition:(NSDictionary *)condition;

#pragma mark -- 业务接口
- (void)getMallWithDelegate:(id)delegate;

@end


