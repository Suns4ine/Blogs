//
//  AnotherBlogPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class AnotherBlogPresenter {
	weak var view: AnotherBlogViewInput?
    weak var moduleOutput: AnotherBlogModuleOutput?

	private let router: AnotherBlogRouterInput
	private let interactor: AnotherBlogInteractorInput

    init(router: AnotherBlogRouterInput, interactor: AnotherBlogInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AnotherBlogPresenter: AnotherBlogModuleInput {
}

extension AnotherBlogPresenter: AnotherBlogViewOutput {
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapFollowButton() {
        debugPrint("didTapFollowButton")
    }
    
    func didTaplikeIcon() {
        debugPrint("didTaplikeIcon")
    }
    
    func didTapShareIcon() {
        debugPrint("didTapShareIcon")
    }
    
}

extension AnotherBlogPresenter: AnotherBlogInteractorOutput {
}
