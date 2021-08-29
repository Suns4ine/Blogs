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
    var password: String
    var identifier: String
    var name: String
    var surname: String
    var tagname: String
    var arrayBlogs: [Blog]
    var arrayDrafts: [Blog]
    var arrayFollowers: [User]
    var arrayFolloving: [User]
    var aboutMe: String
    var avatar: UIImage
    var personalSetting: String
}

var defaultUser = User(dateCreate: .init(),
                       mail: "mail",
                       password: "password",
                       identifier: "identifier",
                       name: "name",
                       surname: "surname",
                       tagname: "tagname",
                       arrayBlogs: [],
                       arrayDrafts: [],
                       arrayFollowers: [],
                       arrayFolloving: [],
                       aboutMe: "About Me",
                       avatar: UIImage(),
                       personalSetting: "personalSetting")

let anotherDefaultUser = User(dateCreate: .init(),
                       mail: "AnotherMail",
                       password: "AnotherPassword",
                       identifier: "AnotherIdentifier",
                       name: "AnotherName",
                       surname: "AnotherSurname",
                       tagname: "AnotherTagname",
                       arrayBlogs: [],
                       arrayDrafts: [],
                       arrayFollowers: [],
                       arrayFolloving: [],
                       aboutMe: "About Another",
                       avatar: UIImage(),
                       personalSetting: "AnotherPersonalSetting")
