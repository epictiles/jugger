//
//  ETFieldViewController.h
//  Jugger
//
//  Created by Barney Mattox on 5/26/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETField.h"
#import "ETJuggerView.h"

@interface ETFieldViewController : UIViewController

@property (nonatomic) IBOutlet UIView* field;
@property (nonatomic) IBOutlet UIImageView* fieldImageView;
@property (nonatomic) IBOutlet UILabel* teamA;
@property (nonatomic) IBOutlet UILabel* teamB;
@property (nonatomic) IBOutlet UIView* activeFighter;
@property (nonatomic) IBOutlet UIView* selector;
@property (nonatomic) ETField* fieldModel;
@property (nonatomic) IBOutletCollection(ETJuggerView) NSArray* juggerViews;


- (IBAction)tapFighter:(UITapGestureRecognizer *)recognizer;
- (IBAction)panFighter:(UIPanGestureRecognizer*)recognizer;
- (IBAction)rotateFighter:(UIRotationGestureRecognizer*)recognizer;


@end
