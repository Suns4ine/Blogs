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
}

protocol AdditionBlogViewOutput: class {
    func didTapBackButton()
    func didTapNextButton()
}

protocol AdditionBlogInteractorInput: class {
}

protocol AdditionBlogInteractorOutput: class {
}

protocol AdditionBlogRouterInput: class {
    func openMyProfileViewController()
    func popViewController()
}