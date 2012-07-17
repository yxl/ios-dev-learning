//
//  OutletsAndActionsAppDelegate.h
//  OutletsAndActions
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OutletsAndActionsViewController;

@interface OutletsAndActionsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet OutletsAndActionsViewController *viewController;

@end
