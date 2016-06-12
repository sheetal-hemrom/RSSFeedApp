//
//  NewsItem+CoreDataProperties.m
//  RSSFeedApp
//
//  Created by user on 6/8/16.
//  Copyright © 2016 Sheetal. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NewsItem+CoreDataProperties.h"

@implementation NewsItem (CoreDataProperties)

@dynamic title;
@dynamic link;
@dynamic imageDetails;
@dynamic guid;
@dynamic pubDate;
@dynamic thumbNailURL;
@dynamic descriptionText;

@end
