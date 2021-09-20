//
//  ChoiceCellProtocol.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation

protocol ChoiceCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}

protocol ChoiceSectionRowPresentable {
    var rows: [ChoiceCellIdentifiable] { get set }
}


protocol ChoiceCellModelRepresentable {
    var viewModel: ChoiceCellIdentifiable? { get set }
}
