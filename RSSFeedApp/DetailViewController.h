//
//  DetailViewController.h
//  RSSFeedApp
//
//  Created by user on 6/7/16.
//  Copyright © 2016 Sheetal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webDetailView;

@end

