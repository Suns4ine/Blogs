//
//  User.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

struct User {
    let dateCreate: Date
    var mail: String
    var identifier: String
    var name: String
    var surname: String
    var tagname: String
    var arrayBlogs: [Blog]
    var arrayFollowers: [User]
    var arrayFolloving: [User]
    var aboutMe: String
    var avatar: UIImage
    var personalSetting: String
}

let defaultUser = User(dateCreate: .init(),
                       mail: "mail",
                       identifier: "identifier",
                       name: "name",
                       surname: "surname",
                       tagname: "tagname",
                       arrayBlogs: [],
                       arrayFollowers: [],
                       arrayFolloving: [],
                       aboutMe: "About Me",
                       avatar: UIImage(),
                       personalSetting: "personalSetting")
