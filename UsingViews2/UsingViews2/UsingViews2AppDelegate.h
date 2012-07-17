//
//  UsingViews2AppDelegate.h
//  UsingViews2
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UsingViews2ViewController;

@interface UsingViews2AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UsingViews2ViewController *viewController;

@end
