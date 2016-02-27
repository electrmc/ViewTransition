//
//  InteractiveViewController.h
//  ViewControllerTransition
//
//  Created by MiaoChao on 16/2/27.
//  Copyright © 2016年 MiaoChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InteractiveViewController : UIViewController

- (void)customDismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);

@end
