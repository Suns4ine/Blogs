//
//  SettingPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

final class SettingPresenter {
	weak var view: SettingViewInput?
    weak var moduleOutput: SettingModuleOutput?

	private let router: SettingRouterInput
	private let interactor: SettingInteractorInput

    init(router: SettingRouterInput, interactor: SettingInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SettingPresenter: SettingModuleInput {
}

extension SettingPresenter: SettingViewOutput {
    
    func didTapSettingButtonTableViewCell(at indexPath: IndexPath) {
        interactor.settingButtonCell(at: indexPath)
    }
    
    func didTapToggleButtonTableViewCell(_ cortage: (IndexPath, Bool)) {
        interactor.toggleButtonCell(cortage)
    }
    
    func fetchSettingsCell() {
        interactor.fetchSettings()
    }
    
    func didTapSettingTableViewCell(at indexPath: IndexPath) {
        interactor.getSetting(at: indexPath)
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
}

extension SettingPresenter: SettingInteractorOutput {
    func settingDidRecieve(cartage: (IndexPath, Setting)) {
        let index = cartage.0
        let viewModel = SettingCellViewModel.init(setting: cartage.1)
        
        view?.updateSettingCell(cartage: (index, viewModel))
    }
    
    
    func settingsDidRecieve(_ settings: [Setting]) {
        let section = SettingSectionViewModel()
        settings.forEach{ section.rows.append(SettingCellViewModel.init(setting: $0))}
        view?.reloadData(for: section)

    }
    
    func openChoiceColor(_ setting: Setting) {
        router.openChoiceColorViewController(with: setting)
    }
    
    func openChoiceLanguage(_ setting: Setting) {
        router.openChoiceLanguageViewController(with: setting)
    }
    
    func openPasswordChange(_ setting: Setting) {
        router.openPasswordChangeViewController(with: setting)
    }
    
    func openHelp(_ setting: Setting) {
        router.openHelpViewController(with: setting)
    }
    
    func openAboutTheApplication(_ setting: Setting) {
        router.openAboutTheApplicationViewController(with: setting)
    }
    
    func openStart() {
        router.openStartViewController()
    }
    
    
}
