//
//  ContactsManager.swift
//  Profile Explorer
//
//  Created by Bianca Hinova on 6/15/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit
import Contacts

class ContactsManager: NSObject {
    
    func checkAuthorization() -> Bool{
        let status = CNContactStore.authorizationStatusForEntityType(.Contacts)
        if status == .Denied || status == .Restricted {
            return false
        } else {
            return true
        }
    }
    
    func getContacts() -> [String] {
        
        let store = CNContactStore()
        store.requestAccessForEntityType(.Contacts) { granted, error in
            guard granted else {
                dispatch_async(dispatch_get_main_queue()) {
                    // user didn't grant authorization, so tell them to fix that in settings
                    print(error)
                }
                return
            }
        }

        var contacts = [CNContact]()
        let request = CNContactFetchRequest(keysToFetch: [CNContactIdentifierKey, CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName)])
        do {
            try store.enumerateContactsWithFetchRequest(request) { contact, stop in
                contacts.append(contact)
            }
        } catch {
            print(error)
        }
        
        var names = [String]()
        let formatter = CNContactFormatter()
        formatter.style = .FullName
        for contact in contacts {
            let nameToAppend = formatter.stringFromContact(contact)
            if(nameToAppend != nil) {
                names.append(nameToAppend!)
            } else {
                print("nil name")
            }
        }
        return names
    }
}
