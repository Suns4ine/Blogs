//
//  PasswordChangePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class PasswordChangePresenter {
	weak var view: PasswordChangeViewInput?
    weak var moduleOutput: PasswordChangeModuleOutput?

	private let router: PasswordChangeRouterInput
	private let interactor: PasswordChangeInteractorInput

    init(router: PasswordChangeRouterInput, interactor: PasswordChangeInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension PasswordChangePresenter: PasswordChangeModuleInput {
}

extension PasswordChangePresenter: PasswordChangeViewOutput {
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapSaveButton() {
        router.popViewController()
    }
    
}

extension PasswordChangePresenter: PasswordChangeInteractorOutput {
}
