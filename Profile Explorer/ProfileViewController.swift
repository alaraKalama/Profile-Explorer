//
//  ProfileViewController.swift
//  Profile Explorer
//
//  Created by Bianka on 6/12/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var data: Data!
    
    private var user: User!
    
    private var downloadManager: DownloadManager!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var fullname: UILabel!
    
    @IBOutlet weak var customDescription: UITextView!
    
    @IBOutlet weak var friendsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = Data.init()
        user = data.getUser()
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        downloadManager = DownloadManager.init()
        downloadManager.downloadImage(user.imageUrl, view: self.profileImage)
        fullname.text = user.fullname
        customDescription.text = user.customDescription
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logout(sender: AnyObject) {
        print("logout")
        let alertController = UIAlertController(title: "Confirm logout?", message: "", preferredStyle: .Alert)
        
        let OkAction = UIAlertAction(title: "Log out", style: .Default) { (action) in
            self.logout()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
        }
        
        alertController.addAction(OkAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    func logout() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
