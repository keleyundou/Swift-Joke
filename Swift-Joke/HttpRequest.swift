//
//  HttpRequest.swift
//  Swift-Joke
//
//  Created by 冰点 on 15/6/26.
//  Copyright (c) 2015年 冰点. All rights reserved.
//

import UIKit

class HttpRequest: NSObject {
    override init() {
        super.init()
    }
    class func requestWithURL(urlString: String, completionHandler:(data: AnyObject)->Void) {
        var URL = NSURL(string: urlString)
        var req = NSURLRequest(URL: URL!)
        var queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(req, queue: queue) { (response, data, error) -> Void in
            if error != nil {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(data: NSNull())
                })
            } else {
                let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(data: jsonData)
                })
            }
        }
        
    }
}
