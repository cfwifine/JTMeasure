//
//  CFTrainsitionAnimation.h
//  JTMeasure
//
//  Created by comv on 16/9/11.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, CFTrasitionType) {
    CFTrasitionTypePush,
    CFTrasitionTypePop,
};

@interface CFTrainsitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTransitionType:(CFTrasitionType)type;

@end
