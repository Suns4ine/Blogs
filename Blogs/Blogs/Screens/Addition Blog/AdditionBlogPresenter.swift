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
    func setupText() {
        interactor.giveText()
    }
    
    func didFinishNameText(text: String) {
        interactor.newNameText(text: text)
    }
    
    func didFinishTagNameText(text: String) {
        interactor.newTagNameText(text: text)
    }
    
    func didTapBackButton() {
        router.popViewController()
        
    }
    
    func didTapNextButton() {
        interactor.verificationOfEnteredData()
    }
    
}

extension AdditionBlogPresenter: AdditionBlogInteractorOutput {
    func transferTitle(text: String) {
        view?.showTitle(text: text)
    }
    
    func transferTags(text: String) {
        view?.showTags(text: text)
    }
    
    func openMyProfile() {
        router.openMyProfileViewController()
    }
    
    func transferErrorName(text: String) {
        view?.showErrorName(text: text)
    }
    
    func transferErrorTagName(text: String) {
        view?.showErrorTagName(text: text)
    }
    
}
