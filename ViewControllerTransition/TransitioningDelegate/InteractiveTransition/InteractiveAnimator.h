//
//  InteractiveAnimator.h
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/20.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteractiveAnimator : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) UIRectEdge targetEdge;
- (instancetype)initWithTargetEdge:(UIRectEdge)targetEdge;
@end
