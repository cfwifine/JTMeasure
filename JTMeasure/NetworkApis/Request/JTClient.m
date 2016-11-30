//
//  JTClient.m
//  JTMeasure
//
//  Created by comv on 2016/10/25.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "JTClient.h"
#import "JTRequest.h"
#import "JTClientProtocol.h"

@interface JTClient()<JTRequestDelegate>

@property (nonatomic, strong) JTRequest *request;
@property (nonatomic, assign) BOOL       canceled;
@property (nonatomic, weak)   id<JTClientProtocol>delegate;
@property (nonatomic, strong) NSDictionary *rowData;
@end

@implementation JTClient

+ (instancetype)sharedManager {
    static dispatch_once_t predicate;
    static JTClient *shareInstance = nil;
    dispatch_once(&predicate, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)cancelRequest {
    if (!self.canceled) {
        [self.request disconnect];
        self.request = nil;
        self.canceled = YES;
    }
}

- (void)loadRequestMethodName:(NSString *)methodName
                       params:(NSMutableDictionary *)params{
    NSString *url = [NSString stringWithFormat:@"%@%@",@"",methodName];
    self.request = [JTRequest shareManager];
    [self.request requestWithURL:url httpMethod:@"POST" params:[self joinMustParamsWithParams:params] httpHeaderFields:nil delegate:self];
    self.canceled = NO;
    [self.request connect];
    [self printRequestInfoWithUrl:url mustParams:params isPost:YES];
}

- (NSMutableDictionary *)joinMustParamsWithParams:(NSDictionary *)params {
    NSMutableDictionary *mustParams = [NSMutableDictionary dictionaryWithDictionary:params];
    //这里可以拼接一些固定的参数
    return mustParams;
}

//打印出请求的信息
- (void)printRequestInfoWithUrl:(NSString *)url mustParams:(NSMutableDictionary *)mustParams isPost:(BOOL)isPost{
    NSMutableDictionary *dicParameters = [mustParams copy];
    NSString *strWay = isPost?@"POST":@"GET";
    NSError *parseError = nil;
    if (dicParameters && dicParameters.count>0) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dicParameters options:NSJSONWritingPrettyPrinted error:&parseError];
        NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"HttpRequest:\n[\n  Type:%@\n  Url:%@\n  Params:%@\n]",strWay,url,jsonStr);
    }
    else{
        NSLog(@"HttpRequest:\n[\n  Type:%@\n  Url:%@\n  Params:空\n]",strWay,url);
    }

}

//打印返回数据
- (void)printResponseInfoWithKey:(NSString *)key result:(NSDictionary *)result error:(NSError *)error{
    NSMutableDictionary *dicResponses = [result copy];
    if (!error) {
        if (dicResponses && dicResponses.count>0) {
            NSLog(@"HttpResponse:\n[\n  Key:%@\n  Result:%@\n]",key,dicResponses);
        }
        else{
            NSLog(@"HttpResponse:\n[\n  Key:%@\n  Result:空\n]",key);
        }
    }else {
        NSLog(@"HttpResponse:\n[\n  Key:%@\n  Error:%@\n]",key,[error localizedDescription]);
    }
}

#pragma mark -- JTRequestDelegate
- (void)request:(JTRequest *)request key:(NSString *)key resultData:(NSDictionary *)result {
    if (self.canceled) {return;}
    [self.request disconnect];
    [self printResponseInfoWithKey:key result:result error:nil];
    self.rowData = [result copy];
    if (self.delegate && [self.delegate respondsToSelector:@selector(client:key:resultData:)]) {
        [self.delegate client:self key:key resultData:result];
    }
}

- (void)request:(JTRequest *)request key:(NSString *)key failWithError:(NSError *)error {
    if (self.canceled) {return;}
    [self.request disconnect];
    [self printResponseInfoWithKey:key result:nil error:error];
    if (self.delegate && [self.delegate respondsToSelector:@selector(client:key:failWithError:)]) {
        [self.delegate client:self key:key failWithError:error];
    }
}

- (void)request:(JTRequest *)request progress:(float)progress {}

//根据逻辑要求过滤数据
- (NSDictionary *)fetchDataWithReformer:(id<ReformerProtocol>)reformer withCondition:(NSDictionary *)condition{
    if (reformer) {
        return [reformer reformerDataWithRowData:self.rowData filterCondition:condition];
    }else {
        return self.rowData;
    }
}

#pragma mark -- 具体的业务接口
- (void)getMallWithDelegate:(id)delegate {
    self.delegate = delegate;
    [self loadRequestMethodName:@"http://ycapp.oudewa.cn/api/mall/listcategorypost" params:nil];
}

@end
