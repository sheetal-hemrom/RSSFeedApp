//
//  NewsItem+CoreDataProperties.h
//  RSSFeedApp
//
//  Created by user on 6/8/16.
//  Copyright © 2016 Sheetal. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NewsItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *guid;
@property (nullable, nonatomic, retain) NSString *link;
@property (nullable, nonatomic, retain) NSString *descriptionText;
@property (nullable, nonatomic, retain) NSString *thumbNailURL;
@property (nullable, nonatomic, retain) NSString *pubDate;
@property (nullable, nonatomic, retain) NSData *imageDetails;

@end

NS_ASSUME_NONNULL_END
