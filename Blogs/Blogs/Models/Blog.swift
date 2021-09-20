//
//  Blog.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

struct Post: Hashable {
    var date: Date
    var title: String
    var text: String
    var arrayTags: [String]
}

class Blog: Hashable {
    
    //MARK: Create Variable
    var user: User
    var nameUser: String = ""
    var title: String = "title"
    var dateCreate: Date
    var finalPost: Post
    
    var arrayTags: [String] = ["tagSubTitle"]
    var arrayLikeUsers: Set<User> = []
    var arrayShareUsers: Set<User> = []
    var rating: Int = 0
    var identifier: String = ""
    
    init(user: User,
         title: String,
         dateCreate: Date,
         finalPost: Post,
         arrayTags: [String],
         arrayLikeUsers: Set<User>,
         arrayShareUsers: Set<User>,
         rating: Int,
         identifier: String) {
        
        self.user = user
        self.title = title
        self.dateCreate = dateCreate
        self.finalPost = finalPost
        self.arrayTags = arrayTags
        self.arrayLikeUsers = arrayLikeUsers
        self.arrayShareUsers = arrayShareUsers
        self.rating = rating
        self.identifier = identifier
        nameUser = user.tagname
    }
    
    //MARK: System override Functions
    static func == (lhs: Blog, rhs: Blog) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self))
    }
    
    //MARK: Personal Functions
    func deleteBlog() {
        arrayLikeUsers.forEach{ $0.arrayLikedBlogs.remove(self)}
        arrayShareUsers = []
        arrayLikeUsers = []
    }
}

var defaultBlog = Blog(user: defaultUser,
                       title: "title",
                       dateCreate: .init(),
                       finalPost: Post(date: .init(),
                                       title: "title",
                                       text: "text",
                                       arrayTags: []),
                       arrayTags: ["tag1", "tag2", "tag3"],
                       arrayLikeUsers: [],
                       arrayShareUsers: [],
                       rating: 100,
                       identifier: "identifier")

var defaultDraft = Post(date: .init(),
                        title: "",
                        text: "",
                        arrayTags: [])

extension Blog {
    static func randomBlog(user: User) -> Blog {
        let post = Post(date: Date.randomBetween(start: user.dateCreate, end: .init()),
                        title: "".randomTitleBlog(),
                        text: "".randomTextBlog(),
                        arrayTags: "".randomTagsBlog())
        
        let blog = Blog(user: user,
                        title: post.title,
                        dateCreate: post.date,
                        finalPost: post,
                        arrayTags: post.arrayTags,
                        arrayLikeUsers: Set(),
                        arrayShareUsers: Set(),
                        rating: 0,
                        identifier: UUID().uuidString)
        return blog
    }
}
