//
//  BlogCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

final class BlogCellViewModel: BlogCellIdentifiable {
    
    //MARK: Create Variable
    let title: String
    let dateSubTitle: String
    let nameSubTitle: String
    let tagSubTitle: String
    let avatar: String
    let user: User
    
    var cellIdentifier: String {
        "BlogsTableViewCell"
    }
    
    var cellHeight: CGFloat {
        428
    }
    
    init(blog: Blog) {
        title = blog.title
        nameSubTitle = blog.nameUser
        dateSubTitle = blog.finalPost.date.stringDate()
        tagSubTitle = blog.arrayTags.returnEnumerationString()
        avatar = blog.user.avatarURL
        user = blog.user
    }
}

final class BlogSectionViewModel: BlogSectionRowPresentable {
    var rows: [BlogCellIdentifiable] = []
    
}
