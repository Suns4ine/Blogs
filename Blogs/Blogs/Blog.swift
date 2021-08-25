//
//  Blog.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

struct Blog {
    let title: String = "title"
    let dateSubTitle: String = "dateSubTitle"
    let nameSubTitle: String = "nameSubTitle"
    let tagSubTitle: String = "tagSubTitle"
    let avatar: UIImage = UIImage()
    let user: User = .init(avatar: UIImage.init())
}
