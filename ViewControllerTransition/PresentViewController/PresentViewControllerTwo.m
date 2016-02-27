//
//  PresentViewControllerTwo.m
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/20.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import "PresentViewControllerTwo.h"
#import "PresentViewControllerThree.h"
#import "PresentTranaitioningDelegate.h"

@interface PresentViewControllerTwo ()
@property (nonatomic, strong) PresentTranaitioningDelegate *transitionDelegate;
@end

@implementation PresentViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Two";
    self.view.backgroundColor = [UIColor cyanColor];
    
    _transitionDelegate = [[PresentTranaitioningDelegate alloc]init];
    
    UIButton *btnPresent = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnPresent setFrame:CGRectMake(100, 100, 100, 50)];
    [btnPresent setTitle:@"present" forState:UIControlStateNormal];
    [btnPresent addTarget:self action:@selector(btnPresent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPresent];
    
    UIButton *btnDismiss = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnDismiss setFrame:CGRectMake(100, 200, 100, 50)];
    [btnDismiss setTitle:@"dismiss" forState:UIControlStateNormal];
    [btnDismiss addTarget:self action:@selector(btnDismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDismiss];
}

- (void)btnPresent{
    // 此时只需要设置被弹出视图的transitioningDelegate即可
    // 因为所有的动画都是弹出视图来实现的，包含出现动画和消失动画
    // presentedViewController只需要提供个背景就行
    PresentViewControllerThree *vc = [[PresentViewControllerThree alloc]init];
    vc.transitioningDelegate = self.transitionDelegate;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)btnDismiss {
    [self  dismissViewControllerAnimated:YES completion:nil];
}
@end
