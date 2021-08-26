//
//  StandartBlogCellProtocol.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

protocol StandartBlogCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: CGFloat { get }
}

protocol StandartBlogSectionRowPresentable {
    var rows: [StandartBlogCellIdentifiable] { get set }
}


protocol StandartBlogCellModelRepresentable {
    var viewModel: StandartBlogCellIdentifiable? { get set }
}
