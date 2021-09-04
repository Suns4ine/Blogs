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
    func givedraft(draft: Post)
}

protocol CreateBlogModuleOutput: class {
}

protocol CreateBlogViewInput: class {
    func showText(text: String)
    func reloadData(for section: UtiliesSectionViewModel)
}

protocol CreateBlogViewOutput: class {
    func setupText()
    func giveText(text: String)
    func fetchUtiliesCell()
    func didTapBackButton()
    func didTapNextButton()
    func didTapDraftButton()
    func didTapUtilitiesCollectionViewCell(at indexPath: IndexPath)
}

protocol CreateBlogInteractorInput: class {
    func giveText()
    func printTitle()
    func getDraft(draft: Post)
    func getUtility(at indexPath: IndexPath)
    func getText(text: String)
    func fetchUtilies()
    func verificationOfEnteredData()
}

protocol CreateBlogInteractorOutput: class {
    func utiliesDidRecieve(_ utilies: [Utility])
    func utilityDidRecieve(_ utility: Utility)
    func openAdditionblog(_ draft: Post)
    func transferText(text: String)
}

protocol CreateBlogRouterInput: class {
    func openDraftBlogsViewController()
    func openAdditionBlogViewController()
    func popViewController()
}
