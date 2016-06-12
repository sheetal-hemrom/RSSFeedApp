//
//  MasterViewControllerTests.m
//  RSSFeedApp
//
//  Created by user on 6/11/16.
//  Copyright © 2016 Sheetal. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MasterViewController.h"
#import "ItemDetails.h"

@interface MasterViewControllerTests : XCTestCase

@property (nonatomic,strong) MasterViewController *masterViewController;
@end

@implementation MasterViewControllerTests

- (void)setUp {
    [super setUp];
    _masterViewController = [[MasterViewController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInsertNewObjectsFromArray
{
    ItemDetails *itemDetail = [ItemDetails new];
    [itemDetail setLink:@"https://www.google.com"];
    [itemDetail setTitle:@"Hello"];
    [_masterViewController insertNewObjectsFromArray:[NSMutableArray arrayWithObjects:itemDetail, nil]];
    
    NSInteger dataCount = [[_masterViewController.fetchedResultsController sections] count];
    XCTAssertNotEqual(dataCount, 1,@"It should be equal") ;
}

@end
