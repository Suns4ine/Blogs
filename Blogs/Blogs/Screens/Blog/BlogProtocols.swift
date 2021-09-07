//
//  BlogProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 05.09.2021.
//  
//

import Foundation

protocol BlogModuleInput {
	var moduleOutput: BlogModuleOutput? { get }
    func setupBlog(blog: Blog)
}

protocol BlogModuleOutput: class {

}

protocol BlogViewInput: class {
    func setupViewMyBlog()
    func setupViewAnotherBlog()
    func showTitle(text: String)
    func showText(text: String)
    func showTags(text: String)
    func showDate(text: String)
    func showName(text: String)
    func showStatus(text: String)
    func showLike(isOn: Bool)
    func shareData(cartage: (String, String))
}

protocol BlogViewOutput: class {
    func didTapProfile()
    func statusLike()
    func statusSubscribe()
    func setupTextInViews()
    func didTapFollowButton()
    func didTapBackButton()
    func didTapEditButton()
    func didTaplikeIcon()
    func didTapShareIcon()
}

protocol BlogInteractorInput: class {
    func tapProfile()
    func tapLike()
    func shareBlogs()
    func giveStatus()
    func giveLike()
    func subscribe()
    func getBlog(blog: Blog)
    func transferTextInViews()
}

protocol BlogInteractorOutput: class {
    func setupMyBlog()
    func setupAnotherBlog()
    func updateStatus(text: String)
    func updateLike(isOn: Bool)
    func userDidRecieve(_ user: User)
    func transferTitle(text: String)
    func transferText(text: String)
    func transferTags(text: String)
    func transferDate(text: String)
    func transferName(text: String)
    func transferData(cartage: (String, String))
}

protocol BlogRouterInput: class {
    func openProfileController(with user: User) 
    func openCreateBlogViewController()
    func popViewController()
}
