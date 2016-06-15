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
    
    var objects = [CNContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getContacts()
    }
    
    func getContacts() {
        let store = CNContactStore()
        if CNContactStore.authorizationStatusForEntityType(.Contacts) == .NotDetermined {
            store.requestAccessForEntityType(.Contacts, completionHandler: { (autorized: Bool, error: NSError?) -> Void in
                if autorized {
                    self.retrieveConstactsWithStore(store)
                }
            })
        } else if CNContactStore.authorizationStatusForEntityType(.Contacts) == .Authorized {
            self.retrieveConstactsWithStore(store)
        }
    }
    
    func retrieveConstactsWithStore(store: CNContactStore) {
        do {
            let groups = try store.groupsMatchingPredicate(nil)
            let predicate = CNContact.predicateForContactsInGroupWithIdentifier(groups[0].identifier)
            let keysToFetch = [CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName), CNContactEmailAddressesKey]
            let contacts = try store.unifiedContactsMatchingPredicate(predicate, keysToFetch: keysToFetch)
            self.objects = contacts
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        } catch {
            print(error)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let contact = self.objects[indexPath.row]
        let formatter = CNContactFormatter()
        
        cell.textLabel?.text = formatter.stringFromContact(contact)
        cell.detailTextLabel?.text = contact.emailAddresses.first?.value as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
