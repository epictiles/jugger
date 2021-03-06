//
//  ETRootViewController.h
//  Jugger
//
//  Created by Barney Mattox on 5/23/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ETModelController;

@interface ETRootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) ETModelController *modelController;

@end
