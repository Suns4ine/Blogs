//
//  AnotherMoreBlogsPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

final class AnotherMoreBlogsPresenter {
	weak var view: AnotherMoreBlogsViewInput?
    weak var moduleOutput: AnotherMoreBlogsModuleOutput?

	private let router: AnotherMoreBlogsRouterInput
	private let interactor: AnotherMoreBlogsInteractorInput

    init(router: AnotherMoreBlogsRouterInput, interactor: AnotherMoreBlogsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AnotherMoreBlogsPresenter: AnotherMoreBlogsModuleInput {
}

extension AnotherMoreBlogsPresenter: AnotherMoreBlogsViewOutput {
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapAnotherBlogsTableViewCell() {
        debugPrint("didTapAnotherBlogsTableViewCell")
    }
    
}

extension AnotherMoreBlogsPresenter: AnotherMoreBlogsInteractorOutput {
}
