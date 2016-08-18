//
//  NewsManager.swift
//  NewsAppSwift
//
//  Created by Hemrom, Sheetal on 11/16/15.
//  Copyright (c) 2015 Hemrom, Sheetal. All rights reserved.
//

import UIKit

class RequestFactory: NSObject {
    
    var xmlParser:XMLParser! = nil;
    
    func fetchRSSFeeds(input: String, completion: (itemsArray: NSMutableArray) -> Void){
        
        let url = NSURL(string: input);
        let requestManager:RequestManager = RequestManager();
        
        //Initialize XML parsing completion block
        let parsingBlock:XMLparserBlock = { (array) -> () in
            completion(itemsArray: array);
        };
        
        // Initialize request completion block
        let block:RequestManagerBlock =  { (url, response) -> () in
            let stringValue:NSString = NSString.init(data: response, encoding: NSUTF8StringEncoding)!;
            print("\(stringValue)")
            self.xmlParser = XMLParser().initWithData(response , block: parsingBlock);
        };
        requestManager.serverCallToURL(url,block: block);
    }
    
    func fetchImageForURL (url : NSURL, completion: (imageData :NSData) ->Void){
         let requestManager:RequestManager = RequestManager();
        requestManager.serverCallToURL(url) { (url, response) in
            completion(imageData: response)
        };
    }
    
    
}
