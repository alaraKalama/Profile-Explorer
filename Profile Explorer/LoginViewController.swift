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
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: self.view.window)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        validator = Validator.init()
        
        username.text = "bianca"
        password.text = "master"
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.view.frame.origin.y += keyboardSize.height
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func attemptLogin(sender: AnyObject) {
        if !validator.areValidUserCredentials(username.text, password: password.text) {
            let alertController = UIAlertController(title: "Ooops", message: "Looks like you name or password are incorrect", preferredStyle: .Alert)
            
            let OkAction = UIAlertAction(title: "Try again", style: .Default) { (action) in
            }
            alertController.addAction(OkAction)
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
