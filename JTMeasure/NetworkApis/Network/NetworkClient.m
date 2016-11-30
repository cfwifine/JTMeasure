//
//  NetworkClient.m
//  YHFoundation
//
//  Created by Yhoon on 16/1/18.
//  Copyright © 2016年 yhoon. All rights reserved.
//

#import "NetworkClient.h"

#define TIMEOUTINTERVER 30
#define BASEURL @""

@interface NetworkClient ()

@property (nonatomic, strong) AFNetworkReachabilityManager *reachablityManager;

@end

@implementation NetworkClient

- (instancetype)init{
    if (self = [super init]) {
        [self configNetworkManager];
    }
    return self;
}

- (void)configNetworkManager{
    NSTimeInterval requestTimeoutInterval = TIMEOUTINTERVER;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    self.netManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASEURL]
                                           sessionConfiguration:configuration];
    
    self.netManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    self.netManager.requestSerializer.timeoutInterval = requestTimeoutInterval;
    
    self.netManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
}

/** 检测网络状态*/
- (AFNetworkReachabilityManager *)checkNetworkStatusWithDomain:(NSString *)domain reachabilityStatusChangeBlock:(reachabilityStatusChangeBlock)block {
    if (domain.length > 0 && domain) {
        self.reachablityManager = [AFNetworkReachabilityManager managerForDomain:domain];
    }else {
        self.reachablityManager = [AFNetworkReachabilityManager sharedManager];
    }
    if (block) {
        [self.reachablityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    block(NetworkStatusWiFi);
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    block(NetworkStatusWWAN);
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    block(NetworkStatusNotReachable);
                    break;
                case AFNetworkReachabilityStatusUnknown:
                    block(NetworkStatusUnkonw);
                    break;
                default:
                    break;
            }
        }];

    }
    [self.reachablityManager startMonitoring];
    return self.reachablityManager;
}

/**json数据请求*/
- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(id)params
                 withMethodType:(NetworkType)networkType
                        success:(void (^)(id data))successBlock
                        failure:(void (^)(NSError *error))failureBlock {
    
    if (!aPath || aPath.length <= 0){DebugLog(@"url不能为空！");  return;}
    
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    switch (networkType) {
            
        case NetworkType_Get: {
            
            [_netManager GET:aPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                successBlock(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
                failureBlock(error);
            }];
            break;
        }
        case NetworkType_Post: {
            
            [_netManager POST:aPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                successBlock(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
                failureBlock(error);
            }];
            break;
        }
    }
}

/**上传头像、文件等接口*/
- (void)requestUploadWithFileData:(id)fileData
                           params:(id)params
                         fileType:(fileDataType)fileType
                            aPath:(NSString *)aPath
                     successBlock:(void (^)(id data))successBlock
                    progressBlock:(void (^)(float progress))progressBlock
                     failureBlock:(void (^)(NSError *error))falureBlock {
    
    if (!aPath || aPath.length <= 0){DebugLog(@"url不能为空！");  return;}
    
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSData *uploadFileData;
    
    if (fileType == fileDataTypeImage && fileData) {
        
        uploadFileData = UIImageJPEGRepresentation(fileData, 0.5);
        
    }else {
        
        if ([fileData isKindOfClass:[NSData class]]) {
            
            uploadFileData = fileData;
            
        }else {
            
            uploadFileData = [NSKeyedArchiver archivedDataWithRootObject:fileData];
        }
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyyMMddHHmmss";
    
    NSString *name = [formatter stringFromDate:[NSDate date]];
    
    name = [NSString stringWithFormat:@"%@",name];
    
    [self.netManager POST:aPath parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (fileType == fileDataTypeImage) {
            
            [formData appendPartWithFileData:uploadFileData name:@"uploadImage" fileName:[NSString stringWithFormat:@"uploadImage-%@",name] mimeType:@"image/jpeg"];
            
        }else if ((fileType == fileDataTypeVoice)) {
            
            [formData appendPartWithFileData:uploadFileData name:@"uploadVoice" fileName:[NSString stringWithFormat:@"uploadVoice-%@",name] mimeType:@"audio/mpeg3"];
            
        }else if ((fileType == fileDataTypeFile)) {
            
            [formData appendPartWithFileData:uploadFileData name:@"uploadVoice" fileName:[NSString stringWithFormat:@"uploadVoice-%@",name] mimeType:@"file"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        float progress = uploadProgress.completedUnitCount *1.0 / uploadProgress.totalUnitCount;
        
        progressBlock(progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        successBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        falureBlock(error);
    }];
}

/** 下载文件*/
- (void)requestDownloadWithApath:(NSString *)aPath
                        savePath:(NSString *)savePath
                    successBlock:(void (^)(id data, NSURL *filePath))successBlock
                   progressBlock:(void (^)(float progress))progressBlock
                    failureBlock:(void (^)(NSError *error))falureBlock {
    
    if (!aPath || aPath.length <= 0){DebugLog(@"url不能为空!");  return;}
    
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:aPath]];
    
    AFURLSessionManager *sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDownloadTask *downloadTask = [sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        float progress = downloadProgress.completedUnitCount *1.0 / downloadProgress.totalUnitCount;
        
        progressBlock(progress);
    
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    
        return [documentsDirectoryURL URLByAppendingPathComponent:response.suggestedFilename];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            
            falureBlock(error);
            
        }else {
    
            successBlock(response, filePath);
            
        }
    }];
    
    [downloadTask resume];
    
}

@end
