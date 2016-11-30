//
//  UIView+Bagde.m
//  JTMeasure
//
//  Created by comv on 2016/11/22.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "UIView+Bagde.h"
#import <objc/runtime.h>

static char *viewTagNameKey;
static char *cusFrameKey;

@implementation UIView (Bagde)

- (NSString *)viewTagName {
    return objc_getAssociatedObject(self, &viewTagNameKey);
}

- (void)setViewTagName:(NSString *)viewTagName {
    objc_setAssociatedObject(self, &viewTagNameKey, viewTagName, OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)cusFrame {
    id value = objc_getAssociatedObject(self, &cusFrameKey);
    if (value && [value isKindOfClass:[NSDictionary class]] && [value count]==4) {
        CGRect frameInfo = CGRectMake([value[@"x"] floatValue],
                                      [value[@"y"] floatValue],
                                      [value[@"width"] floatValue],
                                      [value[@"height"] floatValue]);
        return frameInfo;
    }else {
        return CGRectZero;
    }
}

- (void)setCusFrame:(CGRect)cusFrame {
    NSDictionary *frameInfo = @{@"x": @(cusFrame.origin.x),
                                @"y": @(cusFrame.origin.y),
                                @"width": @(cusFrame.size.width),
                                @"height": @(cusFrame.size.height)};
    objc_setAssociatedObject(self, &cusFrameKey, frameInfo, OBJC_ASSOCIATION_RETAIN);
}

@end
