//
//  Data.swift
//  Profile Explorer
//
//  Created by Bianka on 6/13/16.
//  Copyright © 2016 bianca. All rights reserved.
//

import UIKit

class Data: NSObject {
    private var user: User!
    
    override init() {
        let userData = User(username: "bianca",
            password: "master",
            firstname: "Bianca",
            lastname: "Hinova",
            imageUrl: "https://avatars1.githubusercontent.com/u/10528620?v=3&u=07533ac508058593915942900b7ff7bb5d913fe0&s=140",
            customDescription: "Hello, I love iOS <3")
        user = userData
    }
    
    func getUser() -> User {
        return user
    }
}
