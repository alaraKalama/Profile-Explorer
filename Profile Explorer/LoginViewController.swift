//
//  LoginViewController.swift
//  Profile Explorer
//
//  Created by Bianka on 6/12/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var validator: Validator!
    
    var alert: UIAlertController!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        validator = Validator.init()
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func attemptLogin(sender: AnyObject) {
        if !validator.areValidUserCredentials(username.text, password: password.text) {
            let alertController = UIAlertController(title: "Ooops", message: "Looks like you name or password are incorrect", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "Try again", style: .Default) { (action) in
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true) {
            }
        }
        else {
            login()
        }
    }
    
    func login() {
        let profileViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Profile") as! ProfileViewController
        self.navigationController!.pushViewController(profileViewController, animated: true)
    }
}
