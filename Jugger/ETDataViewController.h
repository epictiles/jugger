//
//  ETDataViewController.h
//  Jugger
//
//  Created by Barney Mattox on 5/23/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ETFieldViewController, ETField;

@interface ETDataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) IBOutlet UIView* containerView;
@property (strong, nonatomic) IBOutlet ETFieldViewController* fieldViewController;
@property (strong, nonatomic) ETField* dataObject;

@end
