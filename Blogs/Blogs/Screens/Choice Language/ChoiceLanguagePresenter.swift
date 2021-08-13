//
//  ChoiceLanguagePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class ChoiceLanguagePresenter {
	weak var view: ChoiceLanguageViewInput?
    weak var moduleOutput: ChoiceLanguageModuleOutput?

	private let router: ChoiceLanguageRouterInput
	private let interactor: ChoiceLanguageInteractorInput

    init(router: ChoiceLanguageRouterInput, interactor: ChoiceLanguageInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ChoiceLanguagePresenter: ChoiceLanguageModuleInput {
}

extension ChoiceLanguagePresenter: ChoiceLanguageViewOutput {
}

extension ChoiceLanguagePresenter: ChoiceLanguageInteractorOutput {
}
