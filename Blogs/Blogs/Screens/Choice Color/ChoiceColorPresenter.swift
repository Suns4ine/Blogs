//
//  ChoiceColorPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class ChoiceColorPresenter {
	weak var view: ChoiceColorViewInput?
    weak var moduleOutput: ChoiceColorModuleOutput?

	private let router: ChoiceColorRouterInput
	private let interactor: ChoiceColorInteractorInput

    init(router: ChoiceColorRouterInput, interactor: ChoiceColorInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ChoiceColorPresenter: ChoiceColorModuleInput {
}

extension ChoiceColorPresenter: ChoiceColorViewOutput {
    func fetchChoicesCell() {
        interactor.fetchChoices()
    }
    
    func didTapColorTableViewCell(at indexPath: Int) {
        interactor.getChoice(at: indexPath)
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
    
}

extension ChoiceColorPresenter: ChoiceColorInteractorOutput {
    func choicesDidRecieve(_ choices: [Choice]) {
        let section = ChoiceSectionViewModel()
        choices.forEach{ section.rows.append(ChoiceCellViewModel.init(choice: $0))}
        view?.reloadData(for: section)
    }
    
    func choiceDidRecieve(_ choice: Choice) {
        debugPrint(choice.title)
    }
    
}
