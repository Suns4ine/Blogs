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
    func settingButtonCell(at indexPath: Int)
    func toggleButtonCell(at indexPath: Int)
    func getSetting(at indexPath: IndexPath)
    func fetchSettings()
}

protocol SettingInteractorOutput: class {
    func settingsDidRecieve(_ settings: [Setting])
    func openChoiceColor(_ setting: Setting)
    func openChoiceLanguage(_ setting: Setting)
    func openPasswordChange(_ setting: Setting)
    func openHelp(_ setting: Setting)
    func openAboutTheApplication(_ setting: Setting)
    func openStart()
}

protocol SettingRouterInput: class {
    func popViewController()
    func openChoiceLanguageViewController(with setting: Setting)
    func openChoiceColorViewController(with setting: Setting)
    func openPasswordChangeViewController(with setting: Setting)
    func openHelpViewController(with setting: Setting)
    func openAboutTheApplicationViewController(with setting: Setting)
    func openStartViewController()
}
