//
//  CreateBlogPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class CreateBlogPresenter {
	weak var view: CreateBlogViewInput?
    weak var moduleOutput: CreateBlogModuleOutput?

	private let router: CreateBlogRouterInput
	private let interactor: CreateBlogInteractorInput

    init(router: CreateBlogRouterInput, interactor: CreateBlogInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CreateBlogPresenter: CreateBlogModuleInput {
}

extension CreateBlogPresenter: CreateBlogViewOutput {
}

extension CreateBlogPresenter: CreateBlogInteractorOutput {
}
