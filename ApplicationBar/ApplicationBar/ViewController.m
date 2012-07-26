//
//  ViewController.m
//  ApplicationBar
//
//  Created by 剑锋 屠 on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define TAG_FOR_CREATE_BUTTON   100080
#define TAG_FOR_FEEDBACK_BUTTON 100081
#define TAG_FOR_PLUS_BUTTON     100082
#define TAG_FOR_MESSAGE_BUTTON  100083

@interface ViewController ()
{
    IBXApplicationBar * _applicationBar;
}

@end

@implementation ViewController

#pragma mark - self

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
    else if (buttonTag == TAG_FOR_MESSAGE_BUTTON) 
    {
        NSLog(@"message clicked");
    }
}

#pragma mark - UIView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_applicationBar == nil) {
        _applicationBar = [[IBXApplicationBar alloc] init];
        [_applicationBar sizeToFit];
        
        _applicationBar.frame = CGRectMake(0, 
                                           self.view.frame.size.height - _applicationBar.frame.size.height, 
                                           _applicationBar.frame.size.width, 
                                           _applicationBar.frame.size.height);
        
        [_applicationBar addDisplayButton:[UIImage imageNamed:@"icon-plus.png"]
                                withTitle:@"Create" 
                                  withTag:TAG_FOR_CREATE_BUTTON];
        [_applicationBar addOptionButton:@"Feedback"
                                 withTag:TAG_FOR_FEEDBACK_BUTTON];
        [_applicationBar addOptionButton:@"Button with icon" 
                                withIcon:[UIImage imageNamed:@"icon-plus.png"] 
                                 withTag:TAG_FOR_PLUS_BUTTON];
        
        _applicationBar.barDelegate = self;
    
        
        [self.view addSubview:_applicationBar];
    }
}

- (void)viewDidUnload
{
    _applicationBar = nil;
    [super viewDidUnload];
}

- (void)dealloc
{
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
