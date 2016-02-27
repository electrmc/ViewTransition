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
    
    _interactiveRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizeDidUpdate:)];
    self.interactiveRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:self.interactiveRecognizer];
}

- (void)gestureRecognizeDidUpdate:(UIScreenEdgePanGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (gesture.edges == UIRectEdgeLeft) {
            [self customDismissViewControllerAnimated:YES completion:nil];
        } else {
            
        }
    }
}

- (void)customDismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    self.transitioningDelegate = self.transitionDelegate;
    [self dismissViewControllerAnimated:flag completion:completion];
}

- (InteractiveTransitioningDelegate*)transitionDelegate{
    if (!_transitionDelegate) {
        _transitionDelegate = [[InteractiveTransitioningDelegate alloc]init];
        _transitionDelegate.gestureRecognizer = self.interactiveRecognizer;
        _transitionDelegate.targetEdge = UIRectEdgeLeft;
    }
    return _transitionDelegate;
}
@end
