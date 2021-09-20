//
//  SettingCellViewModel.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.08.2021.
//

import Foundation

final class SettingCellViewModel: SettingCellIdentifiable {
    
    //MARK: Create Variable
    let title: String
    let subtitle: String
    let icon: Icons
    var condition: SelectSettingCell
    var flag: Bool
    
    var cellIdentifier: String {
        "SettingTableViewCell"
    }
    
    var cellHeight: Float {
        returnCellHeight(condition: condition)
    }
    
    init(setting: Setting) {
        self.flag = setting.flag
        self.icon = setting.icon
        self.title = setting.title
        self.subtitle = setting.subtitle
        self.condition = setting.condition
    }
    
    private func returnCellHeight(condition: SelectSettingCell) -> Float {
        switch condition {
        case .toggle: return 120
        case .screen: return 76
        case .button: return 84
        default: return 0
        }
    }
}

final class SettingSectionViewModel: SettingSectionRowPresentable {
    var rows: [SettingCellIdentifiable] = []
}
