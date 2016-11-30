//
//  NetworkRequest.m
//  MyFrameWork
//
//  Created by 魏初芳 on 16/3/19.
//  Copyright © 2016年 Qingye. All rights reserved.
//

#import "NetworkRequest.h"
#import "NetworkCodeHandle.h"
#import "NetworkErrorHandle.h"
#import "ProgressHUDHandler.h"

#define mNetworkTypeNames @[@"Get", @"Post"]

@interface NetworkRequest()
@property (nonatomic, strong) NetworkClient *networkClient;
@property (nonatomic, strong) NSString *fileSavePath;
@end

@implementation NetworkRequest

+ (NetworkRequest *)sharedRequest{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init{
    if (self = [super init]) {
        self.networkClient = [[NetworkClient alloc] init];
    }
    return self;
}

- (NSString *)fileSavePath {
    if (!_fileSavePath) {
        _fileSavePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    }
    return _fileSavePath;
}

/** 网络检测*/
- (AFNetworkReachabilityManager *)checkCurrentNetworkStatusWithDomain:(NSString *)domain
                                        reachabilityStatusChangeBlock:(networkStatusChangeBlock)block {
    AFNetworkReachabilityManager *manager = [self.networkClient checkNetworkStatusWithDomain:domain reachabilityStatusChangeBlock:block];
    return manager;
}

/** json数据获取*/
- (void)loadRequestWithPath:(NSString *)aPath
                     params:(id)params
                networkType:(NetworkType)networkType
                    success:(void (^)(id data))successBlock
                    failure:(void (^)(NSError *error))failureBlock{

    DebugLog(@"\nDescribe:\n==============Request===============\n%@\n%@:\n%@\n\n\n", mNetworkTypeNames[networkType], aPath, params);
    [self.networkClient requestJsonDataWithPath:aPath
                                     withParams:params
                                 withMethodType:networkType
                                        success:^(id data) {
        
                                            DebugLog(@"\nDescribe:\n==============Response Success==============\n%@:\n%@\n\n\n", aPath, describe(data));

                                            successBlock(data);
        
                                        } failure:^(NSError *error) {
        
                                            DebugLog(@"\nDescribe:\n==============Response Failure==============\n%@:\n%@\n\n\n", aPath, error);
        
                                            failureBlock(error);
        
    }];

}

/** 头像上传*/
- (void)uploadFileDataRequestWithFileData:(id)fileData
                                 fileType:(fileDataType)fileType
                                    aPath:(NSString *)aPath
                                   params:(id)params
                            compelteBlock:(void(^)(id data))completeBlock{
    
    DebugLog(@"\nDescribe:\n==============Request===============\n%@:\n%@\n\n\n",aPath, params);
    
    [self.networkClient requestUploadWithFileData:fileData
                                           params:params
                                         fileType:fileType
                                            aPath:aPath
                                     successBlock:^(id data) {
                                         
                                         DebugLog(@"\nDescribe:\n==============Response Success==============\n%@:\n%@\n\n\n", aPath, describe(data));
                                         
                                         [ProgressHUDHandler dismissSV];
                                         
                                         completeBlock (data);
                                         
                                     }
                                    progressBlock:^(float progress) {
                                        
                                        [ProgressHUDHandler showSVProgress:progress];
        
                                    }
                                     failureBlock:^(NSError *error) {
                                         DebugLog(@"\nDescribe:\n==============Response Failure==============\n%@:\n%@\n\n\n", aPath, error);
                                         
                                         [ProgressHUDHandler dismissSV];
                                         
                                         completeBlock (error);
    }];
    
}

/** 文件下载*/
- (void)downloadFileDataRequestWithApath:(NSString *)aPath
                           compelteBlock:(void(^)(id data, NSURL *filePath))completeBlock {
    
    DebugLog(@"\nDescribe:\n==============Request===============\n%@\n\n\n",aPath);
    
    [self.networkClient requestDownloadWithApath:aPath savePath:self.fileSavePath successBlock:^(id data, NSURL *filePath) {
        
        DebugLog(@"\nDescribe:\n==============Response Success==============\n%@:\n%@\n\n\n", aPath, filePath);
        
        [ProgressHUDHandler dismissSV];
        
        completeBlock(data, filePath);
        
    } progressBlock:^(float progress) {
        
        [ProgressHUDHandler showSVProgress:progress];
        
    } failureBlock:^(NSError *error) {
        
        DebugLog(@"\nDescribe:\n==============Response Failure==============\n%@:\n%@\n\n\n", aPath, error);
        
        [ProgressHUDHandler dismissSV];
        
        completeBlock(error, nil);
    }];
    
}

/************************************************************ 具体使用的接口*************************************************/






@end
