//
//  WebCommunicationViewCtr.m
//  JTMeasure
//
//  Created by comv on 2016/11/17.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "WebCommunicationViewCtr.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "WebCommunicationProtocol.h"

#import "HomeNextVC.h"

@interface WebCommunicationViewCtr ()<UIWebViewDelegate,WebCommunicationProtocol>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *context;

@end

@implementation WebCommunicationViewCtr

- (void)dealloc {
    NSLog(@"%@...dealloc...",self.class);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView = webView;
    webView.delegate = self;
    NSURLRequest *request = [self getRequestWithUrlString:self.urlString];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}

- (NSURLRequest *)getRequestWithUrlString:(NSString *)urlString {
    NSURLCache *urlCache = [NSURLCache sharedURLCache];
    [urlCache setMemoryCapacity:10*1024*1024];
    NSURL *url =[NSURL fileURLWithPath:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:15.0f];
    NSCachedURLResponse *response = [urlCache cachedResponseForRequest:request];
    if (response != nil) {
        if (urlString /*有网络则网络加载*/) {//直接读取缓存
            [request setCachePolicy:NSURLRequestReturnCacheDataDontLoad];
        }else {//判断缓存是否有效，有效则用缓存，
            [request setCachePolicy:NSURLRequestReloadRevalidatingCacheData];
        }
    }
    return request;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        NSLog(@"%@", exceptionValue);
    };
    
    BOOL hasContain = [self.urls containsObject:[[webView.request.URL absoluteString] substringFromIndex:7]];
    if (!hasContain) {
        return;
    }
    if (self.urls.count<=0 || self.blocks.count<=0) {
        return;
    }
    //向js文件中注入oc方法
    for (int i=0; i<self.urls.count; i++) {
        NSString *url = self.urls[i];
        if ([[webView.request.URL absoluteString] isEqualToString:[NSString stringWithFormat:@"file://%@",url]]) {
            NSDictionary *blockDict = self.blocks[i];
            for (NSString *key in blockDict.allKeys) {
                NSString *functionName = key;
                id block = blockDict[key];
                self.context[functionName] = block;
            }
        }
    }
}

@end
