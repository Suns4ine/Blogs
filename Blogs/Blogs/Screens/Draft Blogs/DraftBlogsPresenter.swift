//
//  DraftBlogsPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class DraftBlogsPresenter {
	weak var view: DraftBlogsViewInput?
    weak var moduleOutput: DraftBlogsModuleOutput?

	private let router: DraftBlogsRouterInput
	private let interactor: DraftBlogsInteractorInput

    init(router: DraftBlogsRouterInput, interactor: DraftBlogsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension DraftBlogsPresenter: DraftBlogsModuleInput {
}

extension DraftBlogsPresenter: DraftBlogsViewOutput {
}

extension DraftBlogsPresenter: DraftBlogsInteractorOutput {
}
