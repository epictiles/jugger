//
//  ETDataViewController.m
//  Jugger
//
//  Created by Barney Mattox on 5/23/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "ETDataViewController.h"
#import "ETFieldViewController.h"
#import "ETField.h"

@interface ETDataViewController ()

@end

@implementation ETDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject name];
    
    self.fieldViewController.fieldModel = self.dataObject;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SeguePlayBookToField"]) {
        NSLog(@"Run Segue: SegueEditorToField");
        self.fieldViewController = (ETFieldViewController*)segue.destinationViewController;
        self.fieldViewController.view.frame = self.containerView.frame;
        NSLog(@"field:%@ to container:%@",NSStringFromCGRect(self.fieldViewController.view.frame),
              NSStringFromCGRect(self.containerView.frame));
    }
}

@end
