//
//  ViewController.m
//  SlidingDrawer
//
//  Created by Online Mozilla on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define TAG_FOR_CREATE_BUTTON   100080
#define TAG_FOR_FEEDBACK_BUTTON 100081

@interface ViewController ()
{
  IBXApplicationBar * _applicationBar;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  if (_applicationBar == nil) {
    _applicationBar = [[IBXApplicationBar alloc] init];
    [_applicationBar sizeToFit];
    
    _applicationBar.frame = CGRectMake(0, 
                                       self.view.frame.size.height - _applicationBar.frame.size.height, 
                                       _applicationBar.frame.size.width, 
                                       _applicationBar.frame.size.height);
    
    [_applicationBar addOptionButton:@"Feedback"
                             withTag:TAG_FOR_FEEDBACK_BUTTON];
    [_applicationBar addOptionButton:@"Create"  
                             withTag:TAG_FOR_CREATE_BUTTON];
    
    _applicationBar.barDelegate = self;
    
    
    [self.view addSubview:_applicationBar];
    
  }
}

- (void)viewDidUnload
{
  _applicationBar = nil;
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - IBXApplicationBarDelegate

- (void)barButtonClicked:(NSInteger)buttonTag 
                 withBar:(IBXApplicationBar *)applicationBar
{
  if (buttonTag == TAG_FOR_CREATE_BUTTON) 
  {
    NSLog(@"create button clicked");
  }
  else if (buttonTag == TAG_FOR_FEEDBACK_BUTTON) 
  {
    NSLog(@"feedback button clicked");
  }
}

#pragma mark -
- (IBAction)btnClicked:(id)sender 
{
  if (_applicationBar)
  {
    [_applicationBar toggleView];
  }
}
@end
