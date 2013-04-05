//
//  ChapterListViewController.m
//  AePubReader
//
//  Created by Federico Frappi on 04/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChapterListViewController.h"


@implementation ChapterListViewController

@synthesize epubViewController = _epubViewController;

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_epubViewController.loadedEpub.spineArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  cell.textLabel.numberOfLines = 2;
  cell.textLabel.lineBreakMode = UILineBreakModeMiddleTruncation;
  cell.textLabel.adjustsFontSizeToFitWidth = YES;
  cell.textLabel.text = [[_epubViewController.loadedEpub.spineArray objectAtIndex:[indexPath row]] title];
  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  [_epubViewController loadSpine:[indexPath row] atPageIndex:0 highlightSearchResult:nil];
}

@end
