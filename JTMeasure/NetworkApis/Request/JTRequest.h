//
//  JTRequest.h
//  JTMeasure
//
//  Created by comv on 2016/10/25.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JTRequest;

@protocol JTRequestDelegate <NSObject>

- (void)request:(JTRequest *)request key:(NSString *)key resultData:(NSDictionary *)result;

- (void)request:(JTRequest *)request key:(NSString *)key failWithError:(NSError *)error;

- (void)request:(JTRequest *)request progress:(float)progress;

@end

@interface JTRequest : NSObject

+ (instancetype)shareManager;

- (void)requestWithURL:(NSString *)url
                   httpMethod:(NSString *)httpMethod
                       params:(NSDictionary *)params
             httpHeaderFields:(NSDictionary *)httpHeaderFields
                     delegate:(id<JTRequestDelegate>)delegate;

- (void)connect;

- (void)disconnect;

@end
