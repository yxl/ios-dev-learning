//
//  OutletsAndActionsViewController.m
//  OutletsAndActions
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "OutletsAndActionsViewController.h"

@implementation OutletsAndActionsViewController

@synthesize txtName = _txtName;

-(IBAction) btnClicked:(id) sender
{
    NSString *str = [[NSString alloc] initWithFormat:@"Hello, %@", _txtName.text];
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:@"Hello!" 
                          message:str 
                          delegate:self
                          cancelButtonTitle:@"Done"
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    [str release];
}

-(void)dealloc
{
    [_txtName release];
    [super dealloc];
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
