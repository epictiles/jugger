//
//  ETModelController.h
//  Jugger
//
//  Created by Barney Mattox on 5/23/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETDataViewController;

@interface ETModelController : NSObject <UIPageViewControllerDataSource>

@property (nonatomic, readonly) NSArray* playbook;

- (instancetype)initWithPlaybook:(NSArray*)playbook;

- (ETDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(ETDataViewController *)viewController;

@end
