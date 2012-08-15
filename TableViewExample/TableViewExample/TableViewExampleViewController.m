//
//  ViewController.m
//  TableViewExample
//
//  Created by Online Mozilla on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewExampleViewController.h"

@interface TableViewExampleViewController ()

@end

@implementation TableViewExampleViewController

NSMutableArray *listOfMovies;

- (void)viewDidLoad
{
  // initialize the array
  listOfMovies = [[NSMutableArray alloc] init];
  [listOfMovies addObject:@"Raining Day"];
  [listOfMovies addObject:@"Design of Death"];
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [listOfMovies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  // try to get a reusable cell
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  // create new cell if no reusable cell is available
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  
  // set the text to display 
  NSString *cellValue = [listOfMovies objectAtIndex:indexPath.row];
  cell.textLabel.text = cellValue;
  
  // display an image
  UIImage *image = [UIImage imageNamed:@"head.jpg"];
  cell.imageView.image = image;
  
  return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  return @"Movie List";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
  return @"by Yuan Xulei";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *movieSelected = [listOfMovies objectAtIndex:indexPath.row];
  NSString *msg = [NSString stringWithFormat:@"You have selected %@", movieSelected];
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Movie selected" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
  [alert show];
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return indexPath.row % 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 70;
}
@end
