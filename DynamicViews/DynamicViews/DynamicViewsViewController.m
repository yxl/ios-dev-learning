//
//  DynamicViewsViewController.m
//  DynamicViews
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DynamicViewsViewController.h"

@implementation DynamicViewsViewController

- (void)loadView
{
    // create a UIView object
    UIView* view = [[UIView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
    
    // set the background color to light gray
    view.backgroundColor = [UIColor lightGrayColor];
    
    // create a label view
    CGRect frame = CGRectMake(10, 15, 300, 20);
    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Verdana" size:20];
    label.text = @"This is a label";
    label.tag = 1000;
    
    // create a Button view
    frame = CGRectMake(10, 70, 300, 50);
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    
    [button setTitle:@"Click Me, Please" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.tag = 2000;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:label];
    [view addSubview:button];
    
    self.view = view;
    [label release];   
}

-(IBAction)buttonClicked:(id)sender 
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Action inovkded!" message:@"Button clicked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
