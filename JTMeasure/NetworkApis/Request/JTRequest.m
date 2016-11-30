//
//  JTRequest.m
//  JTMeasure
//
//  Created by comv on 2016/10/25.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "JTRequest.h"
#import <AFNetworking.h>
#import "Constant.h"

#define TIMEOUTINTERVER 30 //超时

@interface JTRequest()

@property (nonatomic, strong)   AFHTTPSessionManager         *netManager;
@property (nonatomic, strong)   AFNetworkReachabilityManager *reachablityManager;
@property (nonatomic, strong)   NSString                     * url;
@property (nonatomic, strong)   NSString                     * httpMethod;
@property (nonatomic, strong)   NSDictionary                 * params;
@property (nonatomic, strong)   NSDictionary                 * httpHeaderFields;
@property (nonatomic, strong)   id <JTRequestDelegate>         delegate;
@property (nonatomic, strong)   NSMutableDictionary            *tasks;
@property (nonatomic, strong)   NSURLSessionTask               *task;

@end

@implementation JTRequest
+ (instancetype)shareManager {
    static dispatch_once_t predicate;
    static JTRequest *shareInstance = nil;
    dispatch_once(&predicate, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (void)dealloc {
    self.url = nil;
    self.httpMethod = nil;
    self.params = nil;
    self.httpHeaderFields = nil;
    self.delegate = nil;
    self.tasks = nil;
    self.netManager = nil;
    self.reachablityManager = nil;
    [self disconnect];
}

- (instancetype)init{
    if (self = [super init]) {
        [self configNetworkManager];
        self.tasks = [NSMutableDictionary dictionary];
        [self checkNetworkStatusWithDomain:@""];
    }
    return self;
}

- (void)configNetworkManager{
    NSTimeInterval requestTimeoutInterval = TIMEOUTINTERVER;
    self.netManager = [AFHTTPSessionManager manager];
    self.netManager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.netManager.requestSerializer.timeoutInterval = requestTimeoutInterval;
    self.netManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    
}

- (void)requestWithURL:(NSString *)url
                   httpMethod:(NSString *)httpMethod
                       params:(NSDictionary *)params
             httpHeaderFields:(NSDictionary *)httpHeaderFields
                     delegate:(id<JTRequestDelegate>)delegate {
    _url = url;
    _httpMethod = httpMethod;
    _params = params;
    _httpHeaderFields = httpHeaderFields;
    _delegate = delegate;
}

- (void)connect {
    if (!self.url || self.url.length <= 0){DebugLog(@"url不能为空！");  return;}
    self.url = [self.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if ([self.httpMethod isEqualToString:@"GET"]) {
       NSURLSessionTask *task = [self.netManager GET:self.url parameters:self.params progress:^(NSProgress * _Nonnull downloadProgress) {
           float progress = downloadProgress.completedUnitCount * 1.0 / downloadProgress.totalUnitCount;
           if (self.delegate && [self.delegate respondsToSelector:@selector(request:progress:)]) {
               [self.delegate request:self progress:progress];
           }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(request:key:resultData:)]) {
                [self.delegate request:self key:self.url resultData:responseObject];
            }
            NSString *key = [@(task.taskIdentifier) stringValue];
            [self.tasks removeObjectForKey:key];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(request:key:failWithError:)]) {
                [self.delegate request:self key:self.url failWithError:error];
            }
            NSString *key = [@(task.taskIdentifier) stringValue];
            [self.tasks removeObjectForKey:key];
        }];
        self.task = task;
        [self controlTaskWithTask:task];

    }else if ([self.httpMethod isEqualToString:@"POST"]) {
//        NSLog(@"count11111:%ld",self.tasks.count);
        NSURLSessionTask *task = [self.netManager POST:self.url parameters:self.params progress:^(NSProgress * _Nonnull uploadProgress) {
            float progress = uploadProgress.completedUnitCount * 1.0 / uploadProgress.totalUnitCount;
            if (self.delegate && [self.delegate respondsToSelector:@selector(request:progress:)]) {
                [self.delegate request:self progress:progress];
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(request:key:resultData:)]) {
                [self.delegate request:self key:self.url resultData:responseObject];
            }
            NSString *key = [@(task.taskIdentifier) stringValue];
            [self.tasks removeObjectForKey:key];
//            NSLog(@"count333333:%ld",self.tasks.count);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(request:key:failWithError:)]) {
                [self.delegate request:self key:self.url failWithError:error];
            }
            NSString *key = [@(task.taskIdentifier) stringValue];
            [self.tasks removeObjectForKey:key];
        }];
        self.task = task;
        [self controlTaskWithTask:task];
    }
}

- (void)disconnect {
    [self.task cancel];
}

- (void)controlTaskWithTask:(NSURLSessionTask *)task {
    NSString *key = [@(task.taskIdentifier) stringValue];
    BOOL hasContained = [self.tasks.allKeys containsObject:key];
    if (hasContained) {
        [[self.tasks objectForKey:key] cancel];
        [self.tasks removeObjectForKey:key];
    };
    [self.tasks setObject:task forKey:key];
//    NSLog(@"count222222:%ld",self.tasks.count);
}

- (void)checkNetworkStatusWithDomain:(NSString *)domain {
    if (domain.length > 0 && domain) {
        self.reachablityManager = [AFNetworkReachabilityManager managerForDomain:domain];
    }else {
        self.reachablityManager = [AFNetworkReachabilityManager sharedManager];
    }
    [self.reachablityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSString *networkState = nil;
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                networkState = @"AFNetWorkStateWiFi";
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                networkState = @"AFNetWorkStateWWAN";
                break;
            case AFNetworkReachabilityStatusNotReachable:
                networkState = @"AFNetWorkStateNotReachable";
                break;
            case AFNetworkReachabilityStatusUnknown:
                networkState = @"AFNetWorkStateUnknown";
                break;
            default:
                break;
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kNetworkState object:networkState];
    }];
    [self.reachablityManager startMonitoring];
}

@end
