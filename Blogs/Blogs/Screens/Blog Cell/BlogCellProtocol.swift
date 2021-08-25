//
//  CellProtocol.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.08.2021.
//

import Foundation
import UIKit

protocol BlogCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: CGFloat { get }
}

protocol BlogSectionRowPresentable {
    var rows: [BlogCellIdentifiable] { get set }
}


protocol BlogCellModelRepresentable {
    var viewModel: BlogCellIdentifiable? { get set }
}
