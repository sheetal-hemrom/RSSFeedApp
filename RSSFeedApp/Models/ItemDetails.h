//
//  ItemDetails.h
//  RSSFeedApp
//
//  Created by user on 6/11/16.
//  Copyright © 2016 Sheetal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemDetails : NSObject
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *guid;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *descriptionText;
@property (nonatomic, retain) NSString *thumbNailURL;
@property (nonatomic, retain) NSString *pubDate;
@property (nonatomic, retain) NSData *imageDetails;

@end
