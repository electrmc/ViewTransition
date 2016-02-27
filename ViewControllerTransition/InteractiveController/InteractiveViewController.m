//
//  InteractiveViewController.m
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/27.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import "InteractiveViewController.h"
#import "InteractiveTransitioningDelegate.h"

@interface InteractiveViewController ()
@property (nonatomic, strong) InteractiveTransitioningDelegate *transitionDelegate;
@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *interactiveRecognizer;
@end

@implementation InteractiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"btnDismiss" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _interactiveRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizeDidUpdate:)];
    self.interactiveRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:self.interactiveRecognizer];
}

- (void)btnDismiss{
    if ([self.transitioningDelegate isKindOfClass:[InteractiveTransitioningDelegate class]]) {
        InteractiveTransitioningDelegate *transitionDelegate = (InteractiveTransitioningDelegate*)self.transitioningDelegate;
        transitionDelegate.targetEdge = UIRectEdgeLeft;
        transitionDelegate.gestureRecognizer = nil;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)gestureRecognizeDidUpdate:(UIScreenEdgePanGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (gesture.edges == UIRectEdgeLeft) {
            if ([self.transitioningDelegate isKindOfClass:[InteractiveTransitioningDelegate class]]) {
                InteractiveTransitioningDelegate *transitionDelegate = (InteractiveTransitioningDelegate*)self.transitioningDelegate;
                transitionDelegate.targetEdge = UIRectEdgeLeft;
                transitionDelegate.gestureRecognizer = gesture;
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

@end
