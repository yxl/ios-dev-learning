//
//  DetailViewController.h
//  TableView
//
//  Created by Online Mozilla on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) NSString *movieSelected;

@end
