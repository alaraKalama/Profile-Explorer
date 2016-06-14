//
//  User.swift
//  Profile Explorer
//
//  Created by Bianka on 6/12/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var username: String!
    var password: String!
    var imageUrl: String!
    var firstname: String!
    var lastname: String!
    var fullname: String!
    var customDescription: String!
    
    init(username: String!, password: String!, firstname: String!, lastname: String!, imageUrl: String, customDescription: String = "This user doesn't have anything to say") {
        super.init()
        self.firstname = firstname
        self.lastname = lastname
        self.fullname = firstname + " " + lastname
        self.username = username
        self.password = password
        self.imageUrl = imageUrl
        self.customDescription = customDescription
    }

}
