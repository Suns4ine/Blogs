//
//  StandartBlogCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

final class StandartBlogCellViewModel: StandartBlogCellIdentifiable {
    
    let title: String
    let dateSubTitle: String
    let nameSubTitle: String
    let tagSubTitle: String
    let avatar: UIImage
    let user: User
    
    var cellIdentifier: String {
        "StandartBlogTableViewCell"
    }
    
    var cellHeight: CGFloat {
        168
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

final class StandartBlogSectionViewModel: StandartBlogSectionRowPresentable {
    var rows: [StandartBlogCellIdentifiable] = []
    
}
