//
//  DynamicViewsAppDelegate.h
//  DynamicViews
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DynamicViewsViewController;

@interface DynamicViewsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DynamicViewsViewController *viewController;

@end
