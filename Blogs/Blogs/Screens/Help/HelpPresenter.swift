//
//  HelpPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class HelpPresenter {
	weak var view: HelpViewInput?
    weak var moduleOutput: HelpModuleOutput?

	private let router: HelpRouterInput
	private let interactor: HelpInteractorInput

    init(router: HelpRouterInput, interactor: HelpInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension HelpPresenter: HelpModuleInput {
}

extension HelpPresenter: HelpViewOutput {
}

extension HelpPresenter: HelpInteractorOutput {
}
