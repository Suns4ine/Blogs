//
//  Blog.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

class Blog: Hashable {
    
    static func == (lhs: Blog, rhs: Blog) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
    }
    
    let user: User
    var title: String = "title"
    var dateCreate: Date
    var dateEdit: Date
    var finalPost: Post
    
    var arrayTags: [String] = ["tagSubTitle"]
    var arrayLikeUsers: [User] = []
    var arrayShareUsers: [User] = []
    var rating: Int = 0
    var identifier: String = ""
    
    init(user: User,
         title: String,
         dateCreate: Date,
         dateEdit: Date,
         finalPost: Post,
         arrayTags: [String],
         arrayLikeUsers: [User],
         arrayShareUsers: [User],
         rating: Int,
         identifier: String) {
        
        self.user = user
        self.title = title
        self.dateCreate = dateCreate
        self.dateEdit = dateEdit
        self.finalPost = finalPost
        self.arrayTags = arrayTags
        self.arrayLikeUsers = arrayLikeUsers
        self.arrayShareUsers = arrayShareUsers
        self.rating = rating
        self.identifier = identifier
    }
    
}

struct Post: Hashable {
    var date: Date
    var title: String
    var text: String
    var arrayTags: [String]
}

var defaultBlog = Blog(user: defaultUser,
                       title: "title",
                       dateCreate: .init(),
                       dateEdit: .init(),
                       finalPost: Post(date: .init(),
                                       title: "title",
                                       text: "text",
                                       arrayTags: []),
                       arrayTags: [],
                       arrayLikeUsers: [],
                       arrayShareUsers: [],
                       rating: 100,
                       identifier: "identifier")


var anotherDefaultBlog = Blog(user: defaultUser,
                              title: "anotherTitle",
                              dateCreate: .init(),
                              dateEdit: .init(),
                              finalPost: Post(date: .init(),
                                              title: "anotherTitle",
                                              text: "anotherText",
                                              arrayTags: []),
                              arrayTags: [],
                              arrayLikeUsers: [],
                              arrayShareUsers: [],
                              rating: 100,
                              identifier: "anotherIdentifier")
