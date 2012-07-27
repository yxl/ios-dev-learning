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
  SlidingDrawerMenu *_drawerMenu;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  if (_drawerMenu == nil) 
  {
    _drawerMenu = [[SlidingDrawerMenu alloc] initWithDirection:SlidingDrawerMenuDirectionToTop];
    [_drawerMenu sizeToFit];
    
    _drawerMenu.frame = CGRectMake(0, 
                                       self.view.frame.size.height - _drawerMenu.frame.size.height, 
                                       _drawerMenu.frame.size.width, 
                                       _drawerMenu.frame.size.height);
    
    [_drawerMenu addMenuItem:@"Feedback"
                             withTag:TAG_FOR_FEEDBACK_BUTTON];
    [_drawerMenu addMenuItem:@"Create"  
                             withTag:TAG_FOR_CREATE_BUTTON];
    
    _drawerMenu.menuDelegate = self;
    
    
    [self.view addSubview:_drawerMenu];
  }
}

- (void)viewDidUnload
{
  _drawerMenu = nil;
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - IBXApplicationBarDelegate

- (void)menuItemClicked:(NSInteger)buttonTag 
                 withDrawerMenu:(SlidingDrawerMenu *)drawerMenu
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
- (IBAction)topBtnClicked:(id)sender 
{
  if (_drawerMenu)
  {
    _drawerMenu.direction = SlidingDrawerMenuDirectionToBottom;
    [_drawerMenu toggleView];
  }
}

- (IBAction)bottomBtnClicked:(id)sender 
{
  if (_drawerMenu)
  {
    _drawerMenu.direction = SlidingDrawerMenuDirectionToTop;
    [_drawerMenu toggleView];
  }
}
@end
