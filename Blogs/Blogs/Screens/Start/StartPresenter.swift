//
//  StartPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Foundation

final class StartPresenter {
	weak var view: StartViewInput?
    weak var moduleOutput: StartModuleOutput?

	private let router: StartRouterInput
	private let interactor: StartInteractorInput

    init(router: StartRouterInput, interactor: StartInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension StartPresenter: StartModuleInput {
}

extension StartPresenter: StartViewOutput {
    func statusUser() {
        router.openLoginViewController()
    }
    
    func didTapEmailButton() {
        router.openLoginViewController()
    }
    
    func didTapFacebookButton() {
        router.openLoginViewController()
    }
    
    func didTapTwitterButton() {
        router.openLoginViewController()
    }
}

extension StartPresenter: StartInteractorOutput {
}
