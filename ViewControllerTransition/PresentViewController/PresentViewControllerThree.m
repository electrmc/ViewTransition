//
//  PresentViewControllerThree.m
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/20.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import "PresentViewControllerThree.h"
#import "PresentViewControllerOne.h"

@interface PresentViewControllerThree ()

@end

@implementation PresentViewControllerThree

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnDismiss {
    [self  dismissViewControllerAnimated:YES completion:nil];
}
@end

