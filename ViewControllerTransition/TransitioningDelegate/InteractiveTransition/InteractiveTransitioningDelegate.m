//
//  InteractiveTransitioningDelegate.m
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/20.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import "InteractiveTransitioningDelegate.h"
#import "InteractiveAnimator.h"
#import "PercentDrivenInteractiveTransition.h"

@implementation InteractiveTransitioningDelegate

- (instancetype)init{
    return  [self initWithGestureRecognizer:nil edgeForDragging:UIRectEdgeRight];
}

- (instancetype)initWithGestureRecognizer:(UIScreenEdgePanGestureRecognizer*)gestureRecognizer edgeForDragging:(UIRectEdge)edge{
    self = [super init];
    if (self) {
        self.gestureRecognizer = gestureRecognizer;
        if (edge == UIRectEdgeTop ||
            edge == UIRectEdgeBottom ||
            edge == UIRectEdgeLeft ||
            edge == UIRectEdgeRight) {
            self.targetEdge = edge;
        }else {
            self.targetEdge = UIRectEdgeRight;
        }
    }
    return self;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[InteractiveAnimator alloc]initWithTargetEdge:self.targetEdge];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[InteractiveAnimator alloc]initWithTargetEdge:self.targetEdge];
}

// 如果设置了交互式动画，但是没调用更新，那么会一直停在开始不动！
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    if (self.gestureRecognizer) {
        return [[PercentDrivenInteractiveTransition alloc]initWithGestureRecognizer:_gestureRecognizer edgeForDragging:_targetEdge];
    }else {
        return nil;
    }
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    if (self.gestureRecognizer) {
        return [[PercentDrivenInteractiveTransition alloc]initWithGestureRecognizer:_gestureRecognizer edgeForDragging:_targetEdge];
    }else {
        return nil;
    }
}

@end
