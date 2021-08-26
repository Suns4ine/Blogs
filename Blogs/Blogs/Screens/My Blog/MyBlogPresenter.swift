//
//  MyBlogPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class MyBlogPresenter {
	weak var view: MyBlogViewInput?
    weak var moduleOutput: MyBlogModuleOutput?

	private let router: MyBlogRouterInput
	private let interactor: MyBlogInteractorInput

    init(router: MyBlogRouterInput, interactor: MyBlogInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MyBlogPresenter: MyBlogModuleInput {
}

extension MyBlogPresenter: MyBlogViewOutput {
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapEditButton() {
        router.openCreateBlogViewController()
    }
    
    func didTaplikeIcon() {
        debugPrint("didTaplikeIcon")
    }
    
    func didTapShareIcon() {
        debugPrint("didTapShareIcon")
    }
    
}

extension MyBlogPresenter: MyBlogInteractorOutput {
}