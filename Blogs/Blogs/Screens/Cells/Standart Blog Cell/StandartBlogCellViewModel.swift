//
//  StandartBlogCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation

final class StandartBlogCellViewModel: StandartBlogCellIdentifiable {
    
    //MARK: Create Variable
    let title: String
    let dateSubTitle: String
    let nameSubTitle: String
    let user: User
    
    var cellIdentifier: String {
        "StandartBlogTableViewCell"
    }
    
    var cellHeight: Float {
        168
    }
    
    init(blog: Blog) {
        title = blog.title
        nameSubTitle = blog.nameUser
        dateSubTitle = blog.finalPost.date.stringDate()
        user = blog.user
    }
}

final class StandartBlogSectionViewModel: StandartBlogSectionRowPresentable {
    var rows: [StandartBlogCellIdentifiable] = []
}
