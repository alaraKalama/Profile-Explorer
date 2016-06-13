//
//  PersistencyManager.swift
//  Profile Explorer
//
//  Created by Bianka on 6/13/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {
    
    func saveImage(image: UIImage, filename: String){
        let path = NSHomeDirectory().stringByAppendingString("/Documents/\(filename)")
        let data = UIImagePNGRepresentation(image)
        data?.writeToFile(path, atomically: true)
    }
    
    func downloadImage(url: String) -> (UIImage) {
        let aUrl = NSURL(string: url)
        let data = NSData(contentsOfURL: aUrl!)
        let image = UIImage(data: data!)
        return image!
    }


}
