//
//  SignUpPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Foundation

final class SignUpPresenter {
	weak var view: SignUpViewInput?
    weak var moduleOutput: SignUpModuleOutput?

	private let router: SignUpRouterInput
	private let interactor: SignUpInteractorInput

    init(router: SignUpRouterInput, interactor: SignUpInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SignUpPresenter: SignUpModuleInput {
}

extension SignUpPresenter: SignUpViewOutput {
    func didFinishNameText(text: String) {
        interactor.newNameText(text: text)
    }
    
    func didFinishMailText(text: String) {
        interactor.newMailText(text: text)
    }
    
    func didFinishPasswordText(text: String) {
        interactor.newPasswordText(text: text)
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapRegisterButton() {
       // interactor.verificationOfEnteredData()
        router.openTabBarViewController()
    }
}

extension SignUpPresenter: SignUpInteractorOutput {
    func openTabBar() {
        router.openTabBarViewController()
    }
    
    func transferErrorName(text: String) {
        view?.showErrorName(text: text)
    }
    
    func transferErrorMail(text: String) {
        view?.showErrorMail(text: text)
    }
    
    func transferErrorPassword(text: String) {
        view?.showErrorPassword(text: text)
    }
}
