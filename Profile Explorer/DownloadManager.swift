//
//  DownloadManager.swift
//  Profile Explorer
//
//  Created by Bianka on 6/13/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit

class DownloadManager: NSObject {
    
    func downloadImage(url: String, view: UIImageView) {
        let url = NSURL(string: url)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (responseData, responseUrl, error) -> Void in
            if let data = responseData {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    view.image = UIImage(data: data)
                })
            }
        }
        task.resume()
    }
}
