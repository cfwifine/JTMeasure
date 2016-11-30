//
//  NetworkClient.h
//  YHFoundation
//
//  Created by Yhoon on 16/1/18.
//  Copyright © 2016年 yhoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef NS_OPTIONS(NSInteger, NetworkType) {
    NetworkType_Get = 0,    // GET请求
    NetworkType_Post,       // POST请求
};

typedef NS_OPTIONS(NSInteger, fileDataType) {
    fileDataTypeImage = 0,  //图片
    fileDataTypeVoice,      //语音
    fileDataTypeFile,       //文件
};

typedef NS_OPTIONS(NSInteger, NetworkStatus) {
    NetworkStatusWiFi = 0,      //wifi
    NetworkStatusWWAN,          //流量
    NetworkStatusNotReachable,  //没联网
    NetworkStatusUnkonw,        //未知状态
};

typedef void(^reachabilityStatusChangeBlock)(NetworkStatus status);

@interface NetworkClient : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *netManager;

/** 检测网络状态*/
- (AFNetworkReachabilityManager *)checkNetworkStatusWithDomain:(NSString *)domain
                                 reachabilityStatusChangeBlock:(reachabilityStatusChangeBlock)block;

/** json数据获取接口*/
- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(id)params
                 withMethodType:(NetworkType)networkType
                        success:(void (^)(id data))successBlock
                        failure:(void (^)(NSError *error))failureBlock;

/** 上传头像、文件等接口*/
- (void)requestUploadWithFileData:(id)fileData
                           params:(id)params
                         fileType:(fileDataType)fileType
                            aPath:(NSString *)aPath
                     successBlock:(void (^)(id data))successBlock
                    progressBlock:(void (^)(float progress))progressBlock
                     failureBlock:(void (^)(NSError *error))falureBlock;

/** 下载文件*/
- (void)requestDownloadWithApath:(NSString *)aPath
                        savePath:(NSString *)savePath
                    successBlock:(void (^)(id data, NSURL *filePath))successBlock
                   progressBlock:(void (^)(float progress))progressBlock
                    failureBlock:(void (^)(NSError *error))falureBlock;

@end
