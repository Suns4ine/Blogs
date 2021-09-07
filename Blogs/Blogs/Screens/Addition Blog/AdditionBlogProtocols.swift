//
//  AdditionBlogProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

protocol AdditionBlogModuleInput {
	var moduleOutput: AdditionBlogModuleOutput? { get }
}

protocol AdditionBlogModuleOutput: class {
}

protocol AdditionBlogViewInput: class {
    func showErrorName(text: String)
    func showErrorTagName(text: String)
    func showTitle(text: String)
    func showTags(text: String)
}

protocol AdditionBlogViewOutput: class {
    func setupText()
    func didFinishNameText(text: String)
    func didFinishTagNameText(text: String)
    func didTapBackButton()
    func didTapNextButton()
}

protocol AdditionBlogInteractorInput: class {
    func giveText()
    func newNameText(text: String)
    func newTagNameText(text: String)
    func verificationOfEnteredData()
}

protocol AdditionBlogInteractorOutput: class {
    func transferErrorName(text: String)
    func transferErrorTagName(text: String)
    func openMyProfile()
    func transferTitle(text: String)
    func transferTags(text: String)
}

protocol AdditionBlogRouterInput: class {
    func openMyProfileViewController()
    func popViewController()
}
