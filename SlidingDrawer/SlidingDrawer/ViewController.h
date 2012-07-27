//
//  ViewController.h
//  SlidingDrawer
//
//  Created by Online Mozilla on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlidingDrawerMenu.h"

@interface ViewController : UIViewController <SlidingDrawerMenuDelegate>

- (IBAction)topBtnClicked:(id)sender;

@end
