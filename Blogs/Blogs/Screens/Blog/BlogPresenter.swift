//
//  BlogPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 05.09.2021.
//  
//

import Foundation

final class BlogPresenter {
	weak var view: BlogViewInput?
    weak var moduleOutput: BlogModuleOutput?

	private let router: BlogRouterInput
	private let interactor: BlogInteractorInput

    init(router: BlogRouterInput, interactor: BlogInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension BlogPresenter: BlogModuleInput {
    func setupBlog(blog: Blog) {
        interactor.getBlog(blog: blog)
    }
}

extension BlogPresenter: BlogViewOutput {
    func statusLike() {
        interactor.giveLike()
    }
    
    func statusSubscribe() {
        interactor.giveStatus()
    }
    
    func setupTextInViews() {
        interactor.transferTextInViews()
    }
    
    func didTapFollowButton() {
        interactor.subscribe()
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapEditButton() {
        //router.openCreateBlogViewController()
    }
    
    func didTaplikeIcon() {
        interactor.tapLike()
    }
    
    func didTapShareIcon() {
        interactor.shareBlogs()
        debugPrint("didTapShareIcon")
    }
}

extension BlogPresenter: BlogInteractorOutput {
    func updateLike(isOn: Bool) {
        view?.showLike(isOn: isOn)
    }
    
    func transferData(cartage: (String, String)) {
        view?.shareData(cartage: cartage)
    }
    
    func updateStatus(text: String) {
        view?.showStatus(text: text)
    }
    
    func transferName(text: String) {
        view?.showName(text: text)
    }
    
    func transferTitle(text: String) {
        view?.showTitle(text: text)
    }
    
    func transferText(text: String) {
        view?.showText(text: text)
    }
    
    func transferTags(text: String) {
        view?.showTags(text: text)
    }
    
    func transferDate(text: String) {
        view?.showDate(text: text)
    }
    
    func setupMyBlog() {
        view?.setupViewMyBlog()
    }
    
    func setupAnotherBlog() {
        view?.setupViewAnotherBlog()
    }
}
