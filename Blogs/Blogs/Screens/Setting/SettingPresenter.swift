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
}

extension SettingPresenter: SettingInteractorOutput {
}
