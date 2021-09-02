//
//  SavedPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

final class SavedPresenter {
	weak var view: SavedViewInput?
    weak var moduleOutput: SavedModuleOutput?

	private let router: SavedRouterInput
	private let interactor: SavedInteractorInput

    init(router: SavedRouterInput, interactor: SavedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SavedPresenter: SavedModuleInput {
}

extension SavedPresenter: SavedViewOutput {
    func deleteTableViewCell(at indexPath: IndexPath) {
        interactor.deleteBlog(at: indexPath)
    }
    
    func fetchBlogsCell() {
        interactor.fetchBlogs()
    }
    
    func didTapSavedTableViewCell(at indexPath: IndexPath) {
        interactor.getBlog(at: indexPath)
    }
    
    func didTapSettingButton() {
        router.openSettingViewController()
    }
}

extension SavedPresenter: SavedInteractorOutput {
    func indexDeleteReiceve(_ indexPath: IndexPath) {
        view?.clearTableCell(at: indexPath)
    }
    
    func blogsDidRecieve(_ blogs: [Blog]) {
        let section = StandartBlogSectionViewModel()
        blogs.forEach{ section.rows.append(StandartBlogCellViewModel.init(blog: $0))}
        view?.reloadData(for: section)

    }
    
    func blogDidRecieve(_ blog: Blog) {
        router.openBlogViewController(with: blog)
    }
    
}
