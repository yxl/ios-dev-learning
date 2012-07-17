//
//  OutletsAndActionsViewController.h
//  OutletsAndActions
//
//  Created by Online Mozilla on 7/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UITextField.h>

@interface OutletsAndActionsViewController : UIViewController 
{
@private
    UITextField* _txtName;
}

@property (nonatomic, retain) IBOutlet UITextField* txtName;

-(IBAction) btnClicked:(id) sender;

@end
