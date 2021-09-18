//
//  User.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Firebase
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
    var arrayBlogs: [Blog] {
        didSet {
            guard let user = Auth.auth().currentUser else { return }
            if identifier == user.uid {
                UserManager.updateBlogs(blogs: arrayBlogs, nameArray: "arrayBlogs", queue: DispatchQueue.main)
            }
        }
    }
    var arrayDrafts: [Blog] {
        didSet {
            guard let user = Auth.auth().currentUser else { return }
            if identifier == user.uid {
                UserManager.updateBlogs(blogs: arrayDrafts, nameArray: "arrayDrafts", queue: DispatchQueue.main)
            }
        }
    }
    var arrayLikedBlogs: Set<Blog>
    var arrayFollowers: Set<User>
    var arrayFolloving: Set<User>
    var aboutMe: String {
        didSet {
            aboutMe = aboutMe.trimmingCharacters(in: .whitespaces)
        }
    }
    var avatarURL: String {
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
         avatarURL: String,
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
        self.avatarURL = avatarURL
        self.personalSetting = personalSetting
    }
    
    func currentParametrs() {
        UserDefaults.standard.set(identifier, forKey: UserKeys.avatar.rawValue)
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
        avatarURL = .init()
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
                       avatarURL: UserDefaults.standard.string(forKey: User.UserKeys.avatar.rawValue) ?? "",
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
                   avatarURL: .init(),
                   personalSetting: PersonalSetting(sound: true,
                                                    notification: true,
                                                    language: .ru,
                                                    theme: .unspecified))

extension User {
    func randomUserAvatar() {
        let array = Array(1...6)
        
        let imageName = self.identifier
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        let image = UIImage(named: "AnotherUser\(array.randomElement() ?? 1)") ?? .init()
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
                try? jpegData.write(to: imagePath)
            }
    }

    func randomAnotherUserAvatar() {
        
        let array = Array(1...18)
        
        let imageName = self.identifier
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        let image = UIImage(named: "AnotherUser\(array.randomElement() ?? 11)") ?? .init()
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
                try? jpegData.write(to: imagePath)
            }
    }
    

    static func createArrayAnotherUsers() {
        arrayAnotherUsers = returnArrayAnotherUsers()
    }
    
    static var arrayAnotherUsers: [User] = []

    static func returnArrayAnotherUsers() -> [User] {
        var array: [User] = []
        
        for _ in 1...Int.random(in: 8...11) {
           let user = User(dateCreate: Date.randomBetween(start: Date.startDate, end: .init()),
                           mail: "mail",
                           identifier: UUID().uuidString,
                           name: "".randomName(),
                           surname: "".randomSurname(),
                           tagname: "".randomTagname(),
                           arrayBlogs: [],
                           arrayDrafts: [],
                           arrayLikedBlogs: Set(),
                           arrayFollowers: Set(),
                           arrayFolloving: Set(),
                           aboutMe: "".randomTagname(),
                           avatarURL: "",
                           personalSetting: PersonalSetting(sound: true,
                                                            notification: true,
                                                            language: .ru,
                                                            theme: .unspecified))
            user.randomAnotherUserAvatar()
            user.createArrayAnotherBlogs(user: user)
            array.append(user)
        }
        
        return array
    }

    private func createArrayAnotherBlogs(user: User) {
        
        for _ in 1...Int.random(in: 3...6) {
            user.arrayBlogs.append(Blog.randomBlog(user: user))
        }
        user.arrayBlogs.sort{ $0.dateCreate > $1.dateCreate }
    }

    static func arrayAnotherBlogs() -> [Blog] {
        var array: [Blog] = []
        
        for user in User.arrayAnotherUsers {
            array += user.arrayBlogs
        }
        array.sort{ $0.dateCreate > $1.dateCreate }
        return array
    }
}
