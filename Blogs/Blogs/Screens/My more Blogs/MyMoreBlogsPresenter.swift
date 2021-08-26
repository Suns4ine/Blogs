//
//  MyMoreBlogsPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

final class MyMoreBlogsPresenter {
	weak var view: MyMoreBlogsViewInput?
    weak var moduleOutput: MyMoreBlogsModuleOutput?

	private let router: MyMoreBlogsRouterInput
	private let interactor: MyMoreBlogsInteractorInput

    init(router: MyMoreBlogsRouterInput, interactor: MyMoreBlogsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MyMoreBlogsPresenter: MyMoreBlogsModuleInput {
}

extension MyMoreBlogsPresenter: MyMoreBlogsViewOutput {
    func fetchBlogsCell() {
        interactor.fetchBlogs()
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapMyBlogsTableViewCell(at indexPath: IndexPath) {
        interactor.getBlog(at: indexPath)
    }
    
}

extension MyMoreBlogsPresenter: MyMoreBlogsInteractorOutput {
    func blogsDidRecieve(_ blogs: [Blog]) {
        let section = StandartBlogSectionViewModel()
        blogs.forEach{ section.rows.append(StandartBlogCellViewModel.init(blog: $0))}
        view?.reloadData(for: section)
    }
    
    func blogDidRecieve(_ blog: Blog) {
        router.openBlogViewController(with: blog)
    }
    
}
