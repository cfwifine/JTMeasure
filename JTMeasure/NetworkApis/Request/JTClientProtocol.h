//
//  JTClientProtocol.h
//  JTMeasure
//
//  Created by comv on 2016/10/25.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTClient.h"

@protocol JTClientProtocol <NSObject>

@required
- (void)client:(JTClient *)client key:(NSString *)key resultData:(NSDictionary *)result;

- (void)client:(JTClient *)client key:(NSString *)key failWithError:(NSError *)error;

@optional
- (void)client:(JTClient *)client progress:(float)progress;

@end
