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
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[InteractiveAnimator alloc]initWithTargetEdge:self.targetEdge];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[InteractiveAnimator alloc]initWithTargetEdge:self.targetEdge];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    return [[PercentDrivenInteractiveTransition alloc]initWithGestureRecognizer:_gestureRecognizer edgeForDragging:_targetEdge];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    return [[PercentDrivenInteractiveTransition alloc]initWithGestureRecognizer:_gestureRecognizer edgeForDragging:_targetEdge];
}
@end
