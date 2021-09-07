//
//  PageProtocol.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 02.09.2021.
//

import Foundation

protocol PageIdentifiable {
}

protocol PageSectionRowPresentable {
    var rows: [PageIdentifiable] { get set }
}


protocol PageModelRepresentable {
    var viewModel: PageIdentifiable? { get set }
}
