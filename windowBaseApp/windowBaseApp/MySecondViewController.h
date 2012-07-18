//
//  MySecondViewController.h
//  windowBaseApp
//
//  Created by Online Mozilla on 7/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySecondViewController : UIViewController

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UIButton *button;

- (IBAction) buttonClicked:(id)sender;

@end
