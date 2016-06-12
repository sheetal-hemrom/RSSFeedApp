//
//  MasterViewController.h
//  RSSFeedApp
//
//  Created by user on 6/7/16.
//  Copyright © 2016 Sheetal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)insertNewObjectsFromArray:(NSMutableArray*)array;

@end

