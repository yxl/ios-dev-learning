//
//  DetailViewController.m
//  TableView
//
//  Created by Online Mozilla on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize movieSelected = _movieSelected;

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
  self.title = @"Movie Details";
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = NSLocalizedString(@"Detail", @"Detail");
  }
  return self;
}

- (void)viewDidAppear:(BOOL)animated
{
  _detailDescriptionLabel.text = _movieSelected;
}
@end
