//
//  Validator.swift
//  Profile Explorer
//
//  Created by Bianka on 6/13/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit

class Validator: NSObject {
    private var data: Data!

    override init() {
        data = Data.init()
    }
    
    func areValidUserCredentials(username: String!, password: String!) -> Bool {
        let user = data.getUser()
        if(user.password == password && user.username == username) {
            return true
        } else {
            return false
        }
    }
}
