//
//  CFTrainsitionAnimation.m
//  JTMeasure
//
//  Created by comv on 16/9/11.
//  Copyright © 2016年 QingYe. All rights reserved.
//

#import "CFTrainsitionAnimation.h"

@interface CFTrainsitionAnimation()

@property (nonatomic, assign) CFTrasitionType type;

@end

@implementation CFTrainsitionAnimation

- (instancetype)initWithTransitionType:(CFTrasitionType)type {
    _type = type;
    if (self = [super init]) {
        
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    if (_type == CFTrasitionTypePush) {
        [self doPushAnimationWithTransition:transitionContext];
    }else if (_type == CFTrasitionTypePop) {
        [self doPopAnimationWithTransition:transitionContext];
    }
    
}

//push
- (void)doPushAnimationWithTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    //终点视图frame
    CGRect frame = [transitionContext initialFrameForViewController:fromVC];
    CGRect offScreenFrame = frame;
    
    //先设置到屏幕外面
    offScreenFrame.origin.x = -offScreenFrame.size.width;
    toVC.view.frame = offScreenFrame;
    
    //添加视图
    [containerView addSubview:toVC.view];
    
    //动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.frame = frame;
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}

//pop
- (void)doPopAnimationWithTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIView *containerView = [transitionContext containerView];
    
    CGRect frame = [transitionContext initialFrameForViewController:fromVC];
    CGRect offScreenFrame = frame;
    offScreenFrame.origin.x = -offScreenFrame.size.width;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.frame = offScreenFrame;
    } completion:^(BOOL finished) {
        [toVC.view removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
