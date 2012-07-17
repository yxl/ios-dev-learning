//
//  UsingViewsViewController.m
//  UsingViews
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "UsingViewsViewController.h"

@implementation UsingViewsViewController

@synthesize pageControl = _pageControl;
@synthesize imageView1 = _imageView1;
@synthesize imageView2 = _imageView2;

- (void)didReceiveMemoryWarning 
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc 
{
    [_pageControl release];
    [_imageView1 release];
    [_imageView2 release];
    [super dealloc];
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"This is an alert view" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Option 1", @"Option 2", nil];
    [alert show];
    [alert release];
    
    UIActionSheet* action = [[UIActionSheet alloc] initWithTitle:@"Title of Action Sheet" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:@"Delete Message" otherButtonTitles:@"Option 1", @"Options 2", nil];
    [action showInView:self.view];
    [action release];
    
    // Initialize the first imageview to display an image
    [_imageView1 setImage:[UIImage imageNamed:@"1.JPG"]];
    _tempImageView = _imageView2;
    
    // make the first imageview visible and hide the second
    [_imageView1 setHidden:NO];
    [_imageView2 setHidden:YES];
    
    // add event handler for the page control
    [_pageControl addTarget:self action:@selector(pageTurning:) forControlEvents:UIControlEventValueChanged];
    [super viewDidLoad];
}

// when the page control's value is changed
- (void) pageTurning: (UIPageControl*) pageController 
{
    // get the page number you can turning into
    NSInteger nextPage = [pageController currentPage];
    if (nextPage < 0 || nextPage > 4) 
    {
        return;
    }
    NSString* imageName = [[NSString alloc] initWithFormat:@"%d.JPG", nextPage + 1];
    [_tempImageView setImage:[UIImage imageNamed:imageName]];
    
    // switch the two imageview views
    if (_tempImageView.tag == 0)
    {
        // imageView1
        _tempImageView = _imageView2;
        _bgImageView = _imageView1;
    }
    else 
    {
        // imageView2
        _tempImageView = _imageView1;
        _bgImageView = _imageView2;
    }
    
    // animate the two views flipping
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_tempImageView cache:YES];
    
    [_tempImageView setHidden:YES];
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"flipping view" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:_bgImageView cache:YES];
    
    [_bgImageView setHidden:NO];
    
    [UIView commitAnimations];
    
    [imageName release];
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

- (void)alertView: (UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%d", buttonIndex);
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%d", buttonIndex);
}
@end
