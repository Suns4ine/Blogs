//
//  MyBlogProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

protocol MyBlogModuleInput {
	var moduleOutput: MyBlogModuleOutput? { get }
}

protocol MyBlogModuleOutput: class {
}

protocol MyBlogViewInput: class {
}

protocol MyBlogViewOutput: class {
    func didTapBackButton()
    func didTapEditButton()
    func didTaplikeIcon()
    func didTapShareIcon()
    
}

protocol MyBlogInteractorInput: class {
}

protocol MyBlogInteractorOutput: class {
}

protocol MyBlogRouterInput: class {
    func openCreateBlogViewController()
    func popViewController()
}
