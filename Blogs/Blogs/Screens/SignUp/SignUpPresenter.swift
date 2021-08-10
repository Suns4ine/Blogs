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
}

extension SignUpPresenter: SignUpInteractorOutput {
}
