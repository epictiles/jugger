//
//  ETFieldViewController.m
//  Jugger
//
//  Created by Barney Mattox on 5/26/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "ETFieldViewController.h"
#import "ETJuggerView.h"
#import "ETJugger.h"
#import "ETJuggerTeam.h"

@interface ETFieldViewController ()

@end

@implementation ETFieldViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    if (_fieldModel)
        [self modelUpdated];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Gesture Handling

- (void)addGestureRecognizers {
    NSLog(@"AddGestureRecognizers");
    int counter = 0;
    for (UIView* view in self.juggerViews) {
        if ([view isKindOfClass:[ETJuggerView class]]) {
            [self addGestureRecognizersToView:view];
            counter++;
        }
    }
    NSLog(@"%i instances",counter);
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateFighter:)];
    [self.view addGestureRecognizer:rotateGesture];
}

- (CGFloat)distanceFrom:(CGPoint)fromPoint toPoint:(CGPoint)toPoint {
    return sqrtf(powf(fromPoint.x-toPoint.x,2) + powf(fromPoint.y-toPoint.y,2));
}

- (void)addGestureRecognizersToView:(UIView*)view {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panFighter:)];
    [view addGestureRecognizer:panGesture];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFighter:)];
    [view addGestureRecognizer:tapGesture];
}

- (IBAction)tapFighter:(UITapGestureRecognizer*)recognizer {
    if (![recognizer.view isKindOfClass:[ETJuggerView class]]) {
        self.activeFighter = nil;
        self.selector.alpha = 0.0;
        return;
    }
    self.activeFighter = recognizer.view;
    self.selector.center = CGPointMake(self.activeFighter.center.x, self.activeFighter.center.y);
    NSLog(@"selector tap-moved: %@/%@",NSStringFromCGPoint(self.selector.center),NSStringFromCGRect(self.activeFighter.frame));
    self.selector.alpha = 1.0;
}

- (IBAction)panFighter:(UIPanGestureRecognizer *)recognizer {
    if (![recognizer.view isKindOfClass:[ETJuggerView class]]) {
        self.activeFighter = nil;
        self.selector.alpha = 0.0;
        return;
    }
    
    if (recognizer.state == UIGestureRecognizerStateBegan ||
        recognizer.state == UIGestureRecognizerStateChanged) {
        self.activeFighter = recognizer.view;
        CGPoint center = self.activeFighter.center;
        CGPoint translation = [recognizer translationInView:self.activeFighter.superview];
        
        self.activeFighter.center = CGPointMake(center.x + translation.x, center.y + translation.y);
        [recognizer setTranslation:CGPointZero inView:self.activeFighter.superview];
        self.selector.center = CGPointMake(self.activeFighter.center.x, self.activeFighter.center.y);
        NSLog(@"selector pan-moved: %@",NSStringFromCGPoint(self.selector.center));
        
        self.selector.alpha = 1.0;
    }
}

static CGFloat _lastRotation = 0;

- (IBAction)rotateFighter:(UIRotationGestureRecognizer*)recognizer {
    
    if ([recognizer state]==UIGestureRecognizerStateEnded) {
        _lastRotation = 0.0;
        return;
    }
    
    if (!self.activeFighter) return;
    
    CGFloat rotation = 0.0f - (_lastRotation - [recognizer rotation]);
    
    CGAffineTransform currentTransform = self.activeFighter.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
    
    [self.activeFighter setTransform:newTransform];
    NSLog(@"rotating: %f",[recognizer rotation]);
    _lastRotation = [recognizer rotation];
}

#pragma mark - Model Updates

- (void) reconstructJuggerViews
{
    for (UIView* juggerView in self.juggerViews) {
        [juggerView removeFromSuperview];
    }
    NSMutableArray* juggerViews = [NSMutableArray array];
    int index = 0;
    for (ETJuggerTeam* team in _fieldModel.teams) {
        if (index==0) {
            self.teamA.text = team.teamName;
        } else if (index==1) {
            self.teamB.text = team.teamName;
        };
        for (ETJugger* jugger in team.juggers) {
            ETJuggerView* juggerView = [ETJuggerView juggerView];
            NSLog(@"%@ (position: %@",jugger.name, NSStringFromCGPoint(juggerView.center));
            jugger.boardSide = (index==0? BSRight : BSLeft);
            juggerView.jugger = jugger;
            [self.field addSubview:juggerView];
            NSLog(@"%@ (position2: %@",jugger.name, NSStringFromCGPoint(juggerView.center));
            [juggerViews addObject:juggerView];
        }
        index++;
    }
    self.juggerViews = juggerViews;
}

- (void)modelUpdated {
    [self.fieldImageView setImage:[UIImage imageNamed:_fieldModel.field]];
    [self reconstructJuggerViews];
    [self addGestureRecognizers];
}

- (void) setFieldModel:(ETField *)fieldModel
{
    _fieldModel = fieldModel;
    if (self.view) {
        [self modelUpdated];
    }
}



@end
