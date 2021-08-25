//
//  BlogCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

class BlogCellViewModel: BlogCellIdentifiable {
    
    let title: String
    let dateSubTitle: String
    let nameSubTitle: String
    let tagSubTitle: String
    let avatar: UIImage
    let user: User
    
    var cellIdentifier: String {
        "BlogsTableViewCell"
    }
    
    var cellHeight: CGFloat {
        428
    }
    
    init(blog: Blog) {
        title = blog.title
        nameSubTitle = blog.nameSubTitle
        dateSubTitle = blog.dateSubTitle
        tagSubTitle = blog.tagSubTitle
        avatar = blog.avatar
        user = blog.user
    }
    
}

class BlogSectionViewModel: BlogSectionRowPresentable {
    var rows: [BlogCellIdentifiable] = []
    
}
