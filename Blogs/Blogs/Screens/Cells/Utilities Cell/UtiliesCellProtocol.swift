//
//  UtiliesCellProtocol.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation
import UIKit

protocol UtiliesCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
    var cellWidth: Float { get }
}

protocol UtiliesSectionRowPresentable {
    var rows: [UtiliesCellIdentifiable] { get set }
    var minimumLineSpacing: Float { get }
}


protocol UtiliesCellModelRepresentable {
    var viewModel: UtiliesCellIdentifiable? { get set }
}
