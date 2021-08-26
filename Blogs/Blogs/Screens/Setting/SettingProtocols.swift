//
//  SettingProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

protocol SettingModuleInput {
	var moduleOutput: SettingModuleOutput? { get }
}

protocol SettingModuleOutput: class {
}

protocol SettingViewInput: class {
    func reloadData(for section: SettingSectionViewModel)
}

protocol SettingViewOutput: class {
    func fetchSettingsCell()
    func didTapBackButton()
    func didTapSettingTableViewCell(at indexPath: IndexPath)
    func didTapSettingButtonTableViewCell(at indexPath: Int)
    func didTapToggleButtonTableViewCell(at indexPath: Int)
}

protocol SettingInteractorInput: class {
    func getSetting(at indexPath: IndexPath)
    func fetchSettings()
}

protocol SettingInteractorOutput: class {
    func settingsDidRecieve(_ settings: [Setting])
    func settingDidRecieve(_ setting: Setting)
}

protocol SettingRouterInput: class {
    func popViewController()
    func openChoiceViewController(with setting: Setting)
}
