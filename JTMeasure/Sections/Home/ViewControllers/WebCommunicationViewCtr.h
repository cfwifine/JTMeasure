//
//  WebCommunicationViewCtr.h
//  JTMeasure
//
//  Created by comv on 2016/11/17.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebCommunicationViewCtr : UIViewController

/** 加载页面的地址*/
@property (nonatomic, strong) NSString *urlString;
/** 需要添加方法的urls*/
@property (nonatomic, strong) NSArray  *urls;
/** 每个url对应需要注入的方法*/
@property (nonatomic, strong) NSArray  *blocks;

@end
