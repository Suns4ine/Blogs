//
//  SettingCellProtocol.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation
import UIKit

protocol SettingCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}

protocol SettingSectionRowPresentable {
    var rows: [SettingCellIdentifiable] { get set }
}


protocol SettingCellModelRepresentable {
    var viewModel: SettingCellIdentifiable? { get set }
}
