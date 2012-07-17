//
//  UsingViews2ViewController.h
//  UsingViews2
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsingViews2ViewController : UIViewController
{
    UIWebView* _webView;
}

@property (nonatomic, retain) IBOutlet UIWebView* webView;

@end
