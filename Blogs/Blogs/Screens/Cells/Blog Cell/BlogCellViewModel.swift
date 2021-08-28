//
//  BlogCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

final class BlogCellViewModel: BlogCellIdentifiable {
    
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
        nameSubTitle = blog.finalPost.title
        dateSubTitle = blog.finalPost.title
        tagSubTitle = blog.finalPost.title
        avatar = UIImage()
        user = blog.user
    }
    
}

final class BlogSectionViewModel: BlogSectionRowPresentable {
    var rows: [BlogCellIdentifiable] = []
    
}
