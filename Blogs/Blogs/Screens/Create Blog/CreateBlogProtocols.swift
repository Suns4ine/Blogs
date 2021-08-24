//
//  CreateBlogProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

protocol CreateBlogModuleInput {
	var moduleOutput: CreateBlogModuleOutput? { get }
}

protocol CreateBlogModuleOutput: class {
}

protocol CreateBlogViewInput: class {
}

protocol CreateBlogViewOutput: class {
    func didTapBackButton()
    func didTapNextButton()
    func didTapDraftButton()
    func didTapUtilitiesCollectionViewCell()
}

protocol CreateBlogInteractorInput: class {
}

protocol CreateBlogInteractorOutput: class {
}

protocol CreateBlogRouterInput: class {
    func openDraftBlogsViewController()
    func openAdditionBlogViewController()
    func popViewController()
}
