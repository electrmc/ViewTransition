//
//  InteractiveViewControllerOne.m
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/20.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import "InteractiveViewControllerOne.h"
#import "InteractiveViewController.h"
#import "PresentTranaitioningDelegate.h"
#import "InteractiveTransitioningDelegate.h"

@interface InteractiveViewControllerOne()
@property (nonatomic, strong) InteractiveTransitioningDelegate *transitionDelegate;
@end

@implementation InteractiveViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"InteractiveView";
    _transitionDelegate = [[InteractiveTransitioningDelegate alloc]init];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"present" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPresent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnPresent{
    InteractiveViewController *vc = [[InteractiveViewController alloc]init];
    self.transitionDelegate.gestureRecognizer = nil;
    self.transitionDelegate.targetEdge = UIRectEdgeRight;
    vc.transitioningDelegate = self.transitionDelegate;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
