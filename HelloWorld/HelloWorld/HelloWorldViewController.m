//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Online Mozilla on 7/16/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HelloWorldViewController.h"

@implementation HelloWorldViewController

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

- (IBAction)btnClicked:(id) sender 
{
    // Display an alert view
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello baby!" message:@"Dad is coming." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
}
@end
