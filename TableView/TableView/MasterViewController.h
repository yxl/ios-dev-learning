//
//  MasterViewController.h
//  TableView
//
//  Created by Online Mozilla on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController<UISearchBarDelegate>
{
  @private
  BOOL _isSearchOn;
  BOOL _canSelectRow;
  NSMutableArray *_listOfMoives;
  NSMutableArray *_searchResult;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSDictionary *movieTitles;
@property (strong, nonatomic) NSArray *years;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

- (void)doneSearching: (id)sender;
- (void)searchMoviesTableView;

@end
