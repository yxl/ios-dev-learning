//
//  UsingViewsViewController.h
//  UsingViews
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsingViewsViewController : UIViewController<UIAlertViewDelegate, UIActionSheetDelegate>
{
    IBOutlet UIPageControl* _pageControl;
    IBOutlet UIImageView* _imageView1;
    IBOutlet UIImageView* _imageView2;
    UIImageView* _tempImageView;
    UIImageView* _bgImageView;
}

@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;
@property (nonatomic, retain) IBOutlet UIImageView* imageView1;
@property (nonatomic, retain) IBOutlet UIImageView* imageView2;

@end
