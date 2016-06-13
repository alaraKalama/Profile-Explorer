//
//  ProfileViewController.swift
//  Profile Explorer
//
//  Created by Bianka on 6/12/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var fullname: UILabel!
    
    @IBOutlet weak var customDescription: UITextView!
    
    @IBOutlet weak var friendsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
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
        let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Login") as! LoginViewController
        self.navigationController!.pushViewController(loginViewController, animated: false)
    }
}
