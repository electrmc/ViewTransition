//
//  PresentTransitioningDelegate.h.m
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/27.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import "PresentTransitioningDelegate.h"
#import "PresentAnimator.h"

@implementation PresentTransitioningDelegate

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [PresentAnimator new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [PresentAnimator new];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}
@end
