//
//  Blog.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

struct Blog {
    let user: User
    var title: String = "title"
    var dateCreate: Date
    var dateEdit: Date
    var finalPost: Post
    
    var arrayTags: [String] = ["tagSubTitle"]
    var arrayLikeUsers: [User]
    var arrayShareUsers: [User]
    var rating: Int
    var identifier: String
}

struct Post {
    var date: Date
    var title: String
    var text: String
    var arrayTags: [String]
}

let defaultBlog = Blog(user: defaultUser,
                       dateCreate: .init(),
                       dateEdit: Date.init(),
                       finalPost: Post(date: .init(),
                                       title: "title",
                                       text: "text",
                                       arrayTags: []),
                       arrayLikeUsers: [],
                       arrayShareUsers: [],
                       rating: 100,
                       identifier: "identifier")
