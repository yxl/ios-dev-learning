//
//  RootViewController.h
//  splitViewBasedApp
//
//  Created by Online Mozilla on 7/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController

@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@end
