//
//  FriendsViewController.swift
//  Profile Explorer
//
//  Created by Bianka on 6/12/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit
import Contacts

class FriendsViewController: UITableViewController {
    
    private var contactsManager: ContactsManager!
    
    private var names = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        contactsManager = ContactsManager()
        let authorized = contactsManager.checkAuthorization()
        if !authorized {
            openSettingsAlert()
        } else {
            names = contactsManager.getContacts()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath)
        cell.textLabel?.text = names[indexPath.item] as? String
        return cell
    }
    
    func openSettingsAlert() {
        let alertController = UIAlertController(title: "Access denied", message: "You should allow the app to use your contact information from settings", preferredStyle: .Alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (_) -> Void in
            let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
            if let url = settingsUrl {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        let OkAction = UIAlertAction(title: "Dissmiss", style: .Destructive) { (action) in
        }
        
        alertController.addAction(settingsAction)
        alertController.addAction(OkAction)
        self.presentViewController(alertController, animated: true) {
        }
    }
}
