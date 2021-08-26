//
//  ChoiceCellProtocol.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation
import UIKit

protocol ChoiceCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: CGFloat { get }
}

protocol ChoiceSectionRowPresentable {
    var rows: [ChoiceCellIdentifiable] { get set }
}


protocol ChoiceCellModelRepresentable {
    var viewModel: ChoiceCellIdentifiable? { get set }
}
