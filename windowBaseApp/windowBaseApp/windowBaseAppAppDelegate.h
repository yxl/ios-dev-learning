//
//  windowBaseAppAppDelegate.h
//  windowBaseApp
//
//  Created by Online Mozilla on 7/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelloWorldViewController.h"

@interface windowBaseAppAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HelloWorldViewController *viewController; 

@end
