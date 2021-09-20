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
    
    func didFinishOldPasswordText(text: String) {
        interactor.giveOldPasswordText(text: text)
    }
    
    func didFinishNewPasswordText(text: String) {
        interactor.newPasswordText(text: text)
    }
    
    func didFinishRepeatPasswordText(text: String) {
        interactor.newRepeatPasswordText(text: text)
    }

    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapSaveButton() {
        interactor.verificationOfEnteredData()
    }
}

extension PasswordChangePresenter: PasswordChangeInteractorOutput {
    func openBackViewController() {
        router.popViewController()
    }
    
    func transferErrorOldPassword(text: String) {
        view?.showErrorOldPassword(text: text)
    }
    
    func transferErrorNewPassword(text: String) {
        view?.showErrorNewPassword(text: text)
    }
    
    func transferErrorRepeatPassword(text: String) {
        view?.showErrorRepeatPassword(text: text)
    }
}
