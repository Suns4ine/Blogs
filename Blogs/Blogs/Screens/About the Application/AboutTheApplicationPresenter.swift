//
//  AboutTheApplicationPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class AboutTheApplicationPresenter {
	weak var view: AboutTheApplicationViewInput?
    weak var moduleOutput: AboutTheApplicationModuleOutput?

	private let router: AboutTheApplicationRouterInput
	private let interactor: AboutTheApplicationInteractorInput

    init(router: AboutTheApplicationRouterInput, interactor: AboutTheApplicationInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AboutTheApplicationPresenter: AboutTheApplicationModuleInput {
}

extension AboutTheApplicationPresenter: AboutTheApplicationViewOutput {
    func didTapBackButton() {
        router.popViewController()
    }
}

extension AboutTheApplicationPresenter: AboutTheApplicationInteractorOutput {
}
