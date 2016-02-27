//
//  InteractiveTransitioningDelegate.h
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/20.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteractiveTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *gestureRecognizer;
@property (nonatomic, assign) UIRectEdge targetEdge; // 表示从哪边滑

@end
