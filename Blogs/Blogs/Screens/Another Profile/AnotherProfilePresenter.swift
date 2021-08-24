//
//  AnotherProfilePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class AnotherProfilePresenter {
	weak var view: AnotherProfileViewInput?
    weak var moduleOutput: AnotherProfileModuleOutput?

	private let router: AnotherProfileRouterInput
	private let interactor: AnotherProfileInteractorInput

    init(router: AnotherProfileRouterInput, interactor: AnotherProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AnotherProfilePresenter: AnotherProfileModuleInput {
}

extension AnotherProfilePresenter: AnotherProfileViewOutput {
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapFollowButton() {
        debugPrint("didTapFollowButton")
    }
    
    func didTapBlogTableViewCell() {
        debugPrint("didTapBlogTableViewCell")
    }
    
    func didTapMoreBlogButton() {
        debugPrint("NO WORK")
        router.openAnotherMoreBlogsViewController()
    }
    
}

extension AnotherProfilePresenter: AnotherProfileInteractorOutput {
}
