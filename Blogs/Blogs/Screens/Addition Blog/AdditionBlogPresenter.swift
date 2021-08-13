//
//  AdditionBlogPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class AdditionBlogPresenter {
	weak var view: AdditionBlogViewInput?
    weak var moduleOutput: AdditionBlogModuleOutput?

	private let router: AdditionBlogRouterInput
	private let interactor: AdditionBlogInteractorInput

    init(router: AdditionBlogRouterInput, interactor: AdditionBlogInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AdditionBlogPresenter: AdditionBlogModuleInput {
}

extension AdditionBlogPresenter: AdditionBlogViewOutput {
}

extension AdditionBlogPresenter: AdditionBlogInteractorOutput {
}
