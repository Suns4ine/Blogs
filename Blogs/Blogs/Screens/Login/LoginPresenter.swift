//
//  LoginPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Foundation

final class LoginPresenter {
	weak var view: LoginViewInput?
    weak var moduleOutput: LoginModuleOutput?

	private let router: LoginRouterInput
	private let interactor: LoginInteractorInput

    init(router: LoginRouterInput, interactor: LoginInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension LoginPresenter: LoginModuleInput {
}

extension LoginPresenter: LoginViewOutput {
    func didFinishLoginText(text: String) {
        interactor.newLoginText(text: text)
    }
    
    func didFinishPasswordText(text: String) {
        interactor.newPasswordText(text: text)
    }
    
    func didTapBackButton() {
        router.popViewController()
    }

    func didTapSignInButton() {
        interactor.verificationOfEnteredData()
    }
    
    func didTapSignUpButton() {
        router.openSignUpViewController()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    func transferErrorLogin(text: String) {
        view?.showErrorLogin(text: text)
    }
    
    func transferErrorPassword(text: String) {
        view?.showErrorPassword(text: text)
    }
    
    func openTabBar() {
        router.openTabBarViewController()
    }
}
