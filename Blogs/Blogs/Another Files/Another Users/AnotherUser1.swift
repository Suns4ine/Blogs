//
//  AnotherUser1.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 17.09.2021.
//

import Foundation

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
                       avatarURL: .init(),
                       personalSetting: .init(sound: true,
                                              notification: true,
                                              language: .ru,
                                              theme: .unspecified))

var anotherDefaultBlog = Blog(user: anotherDefaultUser,
                              title: "anotherTitle",
                              dateCreate: .init(),
                              finalPost: Post(date: .init(),
                                              title: "anotherTitle",
                                              text: "anotherText",
                                              arrayTags: []),
                              arrayTags: [],
                              arrayLikeUsers: [],
                              arrayShareUsers: [],
                              rating: 100,
                              identifier: "anotherIdentifier")
