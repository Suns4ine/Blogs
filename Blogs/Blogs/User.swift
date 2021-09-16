//
//  User.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

class User: Hashable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
    }
    
    enum UserKeys: String {
        case dateCreate
        case mail
        case identifier
        case name
        case surname
        case tagname
        case aboutMe
        case avatar
        case arrayBlogs
        case arrayDrafts
        case arrayLikedBlogs
        case arrayFollowers
        case arrayFolloving
        case personalSetting
    }
    
    var dateCreate: Date
    var mail: String
    var identifier: String
    var name: String
    var surname: String
    var tagname: String {
        didSet {
            tagname = tagname.lowercased()
        }
    }
    var arrayBlogs: [Blog]
    var arrayDrafts: [Blog]
    var arrayLikedBlogs: Set<Blog>
    var arrayFollowers: Set<User>
    var arrayFolloving: Set<User>
    var aboutMe: String
    var avatar: String {
        didSet {
            currentParametrs()
        }
    }
    var personalSetting: PersonalSetting {
        didSet {
            personalSetting.currentSetting()
        }
    }
    
    init(dateCreate: Date,
         mail: String,
         identifier: String,
         name: String,
         surname: String,
         tagname: String,
         arrayBlogs: [Blog],
         arrayDrafts: [Blog],
         arrayLikedBlogs: Set<Blog>,
         arrayFollowers: Set<User>,
         arrayFolloving: Set<User>,
         aboutMe: String,
         avatar: String,
         personalSetting: PersonalSetting) {
        
        self.dateCreate = dateCreate
        self.mail = mail
        self.identifier = identifier
        self.name = name
        self.surname = surname
        self.tagname = tagname.lowercased()
        self.arrayBlogs = arrayBlogs
        self.arrayDrafts = arrayDrafts
        self.arrayLikedBlogs = arrayLikedBlogs
        self.arrayFollowers = arrayFollowers
        self.arrayFolloving = arrayFolloving
        self.aboutMe = aboutMe
        self.avatar = avatar
        self.personalSetting = personalSetting
    }
    
    func currentParametrs() {
        UserDefaults.standard.set(avatar, forKey: UserKeys.avatar.rawValue)
    }
    
    func clearUser() {
       mail = "mail"
       identifier = "identifier"
       name = "name"
       surname = "surname"
       tagname = "tagname"
       arrayBlogs = []
       arrayDrafts = []
       arrayLikedBlogs = []
       arrayFollowers = []
       arrayFolloving = []
       aboutMe = "about Me"
        avatar = .init()
       personalSetting = PersonalSetting(sound: true,
                                        notification: false,
                                        language: personalSetting.language,
                                        theme: personalSetting.theme)
    }
}

var defaultUser = User(dateCreate: .init(),
                       mail: "mail",
                       identifier: "identifier",
                       name: "name",
                       surname: "surname",
                       tagname: "tagname",
                       arrayBlogs: [],
                       arrayDrafts: [],
                       arrayLikedBlogs: [],
                       arrayFollowers: [],
                       arrayFolloving: [],
                       aboutMe: "About Me",
                       avatar: UserDefaults.standard.string(forKey: User.UserKeys.avatar.rawValue) ?? "",
                       personalSetting: .init(sound: true,
                                              notification: true,
                                              language: .ru,
                                              theme: .unspecified))

var anotherDefaultUser = User(dateCreate: .init(),
                       mail: "AnotherMail",
                       identifier: "AnotherIdentifier",
                       name: "AnotherName",
                       surname: "AnotherSurname",
                       tagname: "AnotherTagname",
                       arrayBlogs: [],
                       arrayDrafts: [],
                       arrayLikedBlogs: [],
                       arrayFollowers: [],
                       arrayFolloving: [],
                       aboutMe: "About Another",
                       avatar: .init(),
                       personalSetting: .init(sound: true,
                                              notification: true,
                                              language: .ru,
                                              theme: .unspecified))


let newUser = User(dateCreate: .init(),
                   mail: "",
                   identifier: "",
                   name: "".randomName(),
                   surname: "".randomSurname(),
                   tagname: "",
                   arrayBlogs: [],
                   arrayDrafts: [],
                   arrayLikedBlogs: [],
                   arrayFollowers: [],
                   arrayFolloving: [],
                   aboutMe: "",
                   avatar: .init(),
                   personalSetting: PersonalSetting(sound: true,
                                                    notification: true,
                                                    language: .ru,
                                                    theme: .unspecified))
