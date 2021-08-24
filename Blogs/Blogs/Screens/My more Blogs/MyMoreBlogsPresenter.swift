//
//  MyMoreBlogsPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

final class MyMoreBlogsPresenter {
	weak var view: MyMoreBlogsViewInput?
    weak var moduleOutput: MyMoreBlogsModuleOutput?

	private let router: MyMoreBlogsRouterInput
	private let interactor: MyMoreBlogsInteractorInput

    init(router: MyMoreBlogsRouterInput, interactor: MyMoreBlogsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MyMoreBlogsPresenter: MyMoreBlogsModuleInput {
}

extension MyMoreBlogsPresenter: MyMoreBlogsViewOutput {
}

extension MyMoreBlogsPresenter: MyMoreBlogsInteractorOutput {
}
