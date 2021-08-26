//
//  DraftBlogsPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class DraftBlogsPresenter {
	weak var view: DraftBlogsViewInput?
    weak var moduleOutput: DraftBlogsModuleOutput?

	private let router: DraftBlogsRouterInput
	private let interactor: DraftBlogsInteractorInput

    init(router: DraftBlogsRouterInput, interactor: DraftBlogsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension DraftBlogsPresenter: DraftBlogsModuleInput {
}

extension DraftBlogsPresenter: DraftBlogsViewOutput {
    func fetchBlogsCell() {
        interactor.fetchBlogs()
    }
    
    func didTapSavedTableViewCell(at indexPath: IndexPath) {
        interactor.getBlog(at: indexPath)
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
}

extension DraftBlogsPresenter: DraftBlogsInteractorOutput {
    func blogsDidRecieve(_ blogs: [Blog]) {
        let section = StandartBlogSectionViewModel()
        blogs.forEach{ section.rows.append(StandartBlogCellViewModel.init(blog: $0))}
        view?.reloadData(for: section)

    }
    
    func blogDidRecieve(_ blog: Blog) {
        router.openBlogViewController(with: blog)
    }
    
}
