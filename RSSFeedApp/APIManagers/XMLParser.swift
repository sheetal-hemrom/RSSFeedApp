//
//  XMLParser.swift
//  NewsAppSwift
//
//  Created by user on 1/14/16.
//  Copyright © 2016 Hemrom, Sheetal. All rights reserved.
//

import Foundation
import UIKit

typealias XMLparserBlock = (array:NSMutableArray) -> ();

class XMLParser: NSObject,NSXMLParserDelegate {
        var xmlParser:NSXMLParser! = nil;
        var currentItem:ItemDetails!=nil;
        var itemsArray:NSMutableArray! = nil;
        var currentElement:NSString! = "";
        var attributeValue:NSMutableString! = NSMutableString();
        var completionBlock:XMLparserBlock? = nil;
    
    
    func initWithData(data : NSData , block :XMLparserBlock) -> XMLParser
    {
        self.completionBlock = block;
        self.xmlParser = NSXMLParser(data:data);
        self.xmlParser.delegate = self;
        self.xmlParser.parse();
        return self;
    }
    
    
    // MARK: XMLParser Delegates
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        let elementNam:NSString = elementName;
        if(elementNam.isEqualToString("item")){
            if(itemsArray == nil){
                itemsArray = NSMutableArray();
            }
            self.currentElement = elementNam;
            currentItem = ItemDetails();
            itemsArray.addObject(currentItem);
        }
        if(elementNam.isEqualToString("media:content"))
        {
            let dict:NSDictionary = attributeDict;
            let imageUrl:String! = dict.objectForKey("url") as! String;
            currentItem.thumbNailURL = imageUrl;
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if(self.currentElement.isEqualToString("item"))
        {
            let elementNam:NSString = elementName;
            if(elementNam.isEqualToString("item"))
            {
                //reached the end of one item so start from scratch
                self.currentElement = "";
            }
            else if(elementNam.isEqualToString("description"))
            {
                // The property name couldn't be description because of redundant ios naming convention.
                currentItem.descriptionText = String(attributeValue)
            }
            else if currentItem.respondsToSelector(NSSelectorFromString(elementNam as String)) {
                
                    print("Item present \(elementNam)")
                    var value:NSString = NSString(string: attributeValue);
                    value = value.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
                    currentItem.setValue(value, forKey: elementNam as NSString as String)
             }
                
//                var outCount : UInt32 = 0
//                let properties = class_copyPropertyList(ItemDetails.self, &outCount);
//                
//                for i:UInt32  in 0..<outCount {
//                    let strKey : NSString? = NSString(CString: property_getName(properties[Int(i)]), encoding: NSUTF8StringEncoding)
//                    print(strKey)
//                }
                
                
//                
//                let mirrored_object = Mirror(reflecting: currentItem)
//                for (index, attr) in mirrored_object.children.enumerate() {
//                    if let property_name = attr.label as String! {
//                        print("Attr \(index): \(property_name) = \(attr.value)")
//                    }
//                }
        }
        self.attributeValue="";
        
    }
    
    func parser(parser: NSXMLParser, foundAttributeDeclarationWithName attributeName: String, forElement elementName: String, type: String?, defaultValue: String?) {
        NSLog(elementName,attributeName);
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        self.attributeValue.appendString(string);
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        if((completionBlock) != nil)
        {
            completionBlock!(array :itemsArray);
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        if((completionBlock) != nil)
        {
            completionBlock!(array :itemsArray);
        }
    }
}
