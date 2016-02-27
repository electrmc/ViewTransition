//
//  PresentViewControllerOne.m
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/20.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import "PresentViewControllerOne.h"
#import "PresentViewControllerTwo.h"
#import "PresentTranaitioningDelegate.h"

@interface PresentViewControllerOne ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) PresentTranaitioningDelegate *transitionDelegate;
@end

@implementation PresentViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"one";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _transitionDelegate = [[PresentTranaitioningDelegate alloc]init];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"present" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPresent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnPresent{
    // 此时只需要设置被弹出视图的transitioningDelegate即可
    // 因为所有的动画都是弹出视图来实现的，包含出现动画和消失动画
    // presentedViewController只需要提供个背景就行
    PresentViewControllerTwo *vc = [[PresentViewControllerTwo alloc]init];
    vc.transitioningDelegate = self.transitionDelegate;
    [self presentViewController:vc animated:YES completion:nil];
}
@end
