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
    func fetchChoicesCell() {
        interactor.fetchChoices()
    }
    
    func didTapLanguageTableViewCell(at indexPath: Int) {
        interactor.getChoice(at: indexPath)
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
}

extension ChoiceLanguagePresenter: ChoiceLanguageInteractorOutput {
    
    func choicesDidRecieve(_ choices: [Choice]) {
        let section = ChoiceSectionViewModel()
        choices.forEach{ section.rows.append(ChoiceCellViewModel.init(choice: $0))}
        view?.reloadData(for: section)
    }
}
