//
//  MySecondViewController.m
//  windowBaseApp
//
//  Created by Online Mozilla on 7/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MySecondViewController.h"
#import "HelloWorldViewController.h"

@implementation MySecondViewController

@synthesize label;
@synthesize button;

HelloWorldViewController *viewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc 
{
    [viewController release];
    [label release];
    [button release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    // create a CGRect for the positioning
    CGRect frame = CGRectMake(20, 10, 280, 50);
    
    // create a babel view
    label = [[UILabel alloc] initWithFrame: frame];
    label.textAlignment = UITextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Verdana" size: 20];
    label.text = @"This is a label";
    
    // create a button view
    frame = CGRectMake(20, 60, 280, 50);
    button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"OK" forState: UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    
    // add action handler and set current class as target
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // add the views to the view window
    [self.view addSubview: label];
    [self.view addSubview: button];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

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

- (IBAction)buttonClicked:(id)sender
{
    viewController = [[HelloWorldViewController alloc] initWithNibName:@"HelloWorldViewController" bundle:nil];
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    [self.view addSubview:viewController.view];
    [UIView commitAnimations];
    /*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Action invokded!" message:@"Button clicked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
     */
}
@end
