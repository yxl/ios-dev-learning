//
//  viewBasedAppAppDelegate.h
//  viewBasedApp
//
//  Created by Online Mozilla on 7/18/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class viewBasedAppViewController;

@interface viewBasedAppAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet viewBasedAppViewController *viewController;

@end
