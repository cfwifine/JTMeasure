//
//  NSInvocation+Improved.h
//  JTMeasure
//
//  Created by 魏初芳 on 16/7/8.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSInvocation (Improved)

+ (NSInvocation *)invocationWithTarget:(id)_target andSelector:(SEL)_selector;
+ (NSInvocation *)invocationWithTarget:(id)_target andSelector:(SEL)_selector andArguments:(void *)_addressOfFirstArgument, ...;
- (void)invokeOnMainThreadWaitUntilDone:(BOOL)wait;

@end
