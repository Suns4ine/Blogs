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
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapColorTableViewCell() {
        debugPrint("didTapColorTableViewCell")
    }
    
}

extension ChoiceColorPresenter: ChoiceColorInteractorOutput {
}
