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
    func reloadData(for section: UtiliesSectionViewModel)
}

protocol CreateBlogViewOutput: class {
    func fetchUtiliesCell()
    func didTapBackButton()
    func didTapNextButton()
    func didTapDraftButton()
    func didTapUtilitiesCollectionViewCell(at indexPath: IndexPath)
}

protocol CreateBlogInteractorInput: class {
    func getUtility(at indexPath: IndexPath)
    func fetchUtilies()
}

protocol CreateBlogInteractorOutput: class {
    func utiliesDidRecieve(_ utilies: [Utility])
    func utilityDidRecieve(_ utility: Utility)
}

protocol CreateBlogRouterInput: class {
    func openDraftBlogsViewController()
    func openAdditionBlogViewController()
    func popViewController()
}
