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
    func didTapSettingButtonTableViewCell(at indexPath: Int) {
        debugPrint(indexPath)
        debugPrint("didTapSettingButtonTableViewCell")
    }
    
    func didTapToggleButtonTableViewCell(at indexPath: Int) {
        debugPrint(indexPath)
        debugPrint("didTapToggleButtonTableViewCell")
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
    func settingsDidRecieve(_ settings: [Setting]) {
        let section = SettingSectionViewModel()
        settings.forEach{ section.rows.append(SettingCellViewModel.init(setting: $0))}
        view?.reloadData(for: section)

    }
    
    func settingDidRecieve(_ setting: Setting) {
        router.openChoiceViewController(with: setting)
    }
    
}
