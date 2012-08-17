//
//  MasterViewController.m
//  TableView
//
//  Created by Online Mozilla on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
  NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;

@synthesize movieTitles = _movieTitles;
@synthesize years = _years;
@synthesize searchBar = _searchBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.title = NSLocalizedString(@"Master", @"Master");
  }
  return self;
}

- (void)viewDidLoad
{
  self.navigationItem.title = @"List Of Movies";
  
  // path to the property list file
  NSString *path = [[NSBundle mainBundle] pathForResource:@"Movies" ofType:@"plist"];
  
  // load the list into the dictionary
  NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
  
  // save the dictionary object to the property
  _movieTitles = dic;
  
  // get all the keys in the dictionary object and sort them
  NSArray *array = [[_movieTitles allKeys] sortedArrayUsingSelector:@selector(compare:)];
  
  // save the keys in the years property
  _years = array;
  
  // search
  self.tableView.tableHeaderView = _searchBar;
  _searchBar.autocorrectionType = UITextAutocorrectionTypeYes;
  
  // copy all the movie titles in the dictionary into the listOfMovies array
  _listOfMoives = [NSMutableArray new];
  for (NSString *year in array)
  {
    // get all the movies for a particular year
    NSArray *movies = [_movieTitles objectForKey:year];
    for (NSString *title in movies)
    {
      [_listOfMoives addObject:title];
    }
  }
  
  // used for sorting the search result
  _searchResult = [NSMutableArray new];
  
  _isSearchOn = NO;
  _canSelectRow = YES;
  
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.navigationItem.leftBarButtonItem = self.editButtonItem;
  
  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
  self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewDidUnload
{
  _movieTitles = nil;
  _years = nil;
  _searchBar = nil;
  _listOfMoives = nil;
  _searchResult = nil;
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)insertNewObject:(id)sender
{
  if (!_objects) {
    _objects = [[NSMutableArray alloc] init];
  }
  [_objects insertObject:[NSDate date] atIndex:0];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  if (_isSearchOn)
  {
    return 1;
  }
  else 
  {
    return _years.count;
  }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if (_isSearchOn)
  {
    return _searchResult.count;
  }
  
  // check the current year based on the section index
  NSString *year = [_years objectAtIndex:section];
  
  // returns the movies in that year as an arry
  NSArray *movieSection = [_movieTitles objectForKey:year];
  
  // return the number of movies for that year as the number of rows in that section
  return movieSection.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) 
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }
  
  // configure the cell
  if (_isSearchOn) 
  {
    NSString *cellValue = [_searchResult objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
  }
  else
  {  
    // get the year
    NSString *year = [_years objectAtIndex:indexPath.section];
    
    // get the list of movies for that year
    NSArray *movieSection = [_movieTitles objectForKey:year];
    
    // get the particular movie based on that row
    cell.textLabel.text = [movieSection objectAtIndex:indexPath.row];
    
    // set the accessory type
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
  }
  return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Return NO if you do not want the specified item to be editable.
  return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [_objects removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
  }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *year = [_years objectAtIndex:indexPath.section];
  NSArray *movieSection = [_movieTitles objectForKey:year];
  NSString *movieTitle = [movieSection objectAtIndex:indexPath.row];
  NSString *message = [[NSString alloc] initWithFormat:@"You have selected %@", movieTitle];
  
  // Navigate to the details view
  if (!self.detailViewController) {
    self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
  }
  
  // set the movie selected in the method of the DetailViewController
  self.detailViewController.movieSelected = message;
  [self.navigationController pushViewController:self.detailViewController animated:YES];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  if (_isSearchOn)
  {
    return nil;
  }
  // get the year as the section header
  NSString *year = [_years objectAtIndex:section];
  return year;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
  if (_isSearchOn)
  {
    return nil;
  }
  return _years;
}

// fired when the user taps on the searchbar
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
  _isSearchOn =  YES;
  _canSelectRow = NO;
  self.tableView.scrollEnabled = NO;
  
  // add the Done button at the top
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSearching:)];
}

- (void)doneSearching: (id)sender
{
  _isSearchOn = NO;
  _canSelectRow = YES;
  self.tableView.scrollEnabled = YES;
  self.navigationItem.rightBarButtonItem = nil;
  
  // hide the keyboard
  [_searchBar resignFirstResponder];
  
  // refresh the TableView
  [self.tableView reloadData];
}

// fired when the user types something into the searchbar
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
  // if there is something to search for
  if ([searchText length] > 0)
  {
    _isSearchOn = YES;
    _canSelectRow = YES;
    self.tableView.scrollEnabled = YES;
    [self searchMoviesTableView];
  }
  else 
  {
    _isSearchOn = NO;
    _canSelectRow = NO;
    self.tableView.scrollEnabled = NO;
  }
  [self.tableView reloadData];
}

// performs the searching using the array of movies
- (void)searchMoviesTableView
{
  // clear the search result
  [_searchResult removeAllObjects];
  for (NSString *str in _listOfMoives) 
  {
    NSRange titleResultRange = [str rangeOfString:_searchBar.text options:NSCaseInsensitiveSearch];
    if (titleResultRange.length > 0)
    {
      [_searchResult addObject:str];
    }
  }
}

// fired when the user taps the search button on the keyboard
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
  [self searchMoviesTableView];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  return _canSelectRow ? indexPath : nil;
}
@end
