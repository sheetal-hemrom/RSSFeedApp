//
//  RequestManager.swift
//  NewsAppSwift
//
//  Created by Hemrom, Sheetal on 11/12/15.
//  Copyright (c) 2015 Hemrom, Sheetal. All rights reserved.
//

import UIKit

typealias RequestManagerBlock = (url:NSURL, response:NSData) -> ();
class RequestManager: NSObject,NSURLConnectionDataDelegate {
    
    var completionBlock:RequestManagerBlock? = nil;
    var responseData:NSMutableData? = nil;
    var requestUrl:NSURL! = nil;
    func serverCallToURL(url :NSURL!, block :RequestManagerBlock)
    {
        completionBlock = block;
        requestUrl = url;
        let urlRequest:NSMutableURLRequest = NSMutableURLRequest(URL: url);
        urlRequest.HTTPMethod = "GET";
        let connection:NSURLConnection? = NSURLConnection(request: urlRequest, delegate: self, startImmediately: true);
        connection?.start();
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        responseData = NSMutableData();
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData?.appendData(data);
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        NSLog("Connection Falied with error %@",error);
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        NSLog("Connection Finished");
        if((completionBlock) != nil)
        {
            completionBlock!(url: requestUrl,response: responseData!);
        }
       
    }
    
  
}
