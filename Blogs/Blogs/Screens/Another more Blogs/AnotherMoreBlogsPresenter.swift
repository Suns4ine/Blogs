//
//  AnotherMoreBlogsPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

final class AnotherMoreBlogsPresenter {
	weak var view: AnotherMoreBlogsViewInput?
    weak var moduleOutput: AnotherMoreBlogsModuleOutput?

	private let router: AnotherMoreBlogsRouterInput
	private let interactor: AnotherMoreBlogsInteractorInput

    init(router: AnotherMoreBlogsRouterInput, interactor: AnotherMoreBlogsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AnotherMoreBlogsPresenter: AnotherMoreBlogsModuleInput {
    func getArrayBlogs(array: [Blog]) {
        interactor.setupArrayBlogs(array: array)
    }
    
}

extension AnotherMoreBlogsPresenter: AnotherMoreBlogsViewOutput {
    
    func fetchBlogsCell() {
        interactor.fetchBlogs()
    }
    
    func didTapAnotherBlogsTableViewCell(at indexPath: IndexPath) {
        interactor.getBlog(at: indexPath)
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
}

extension AnotherMoreBlogsPresenter: AnotherMoreBlogsInteractorOutput {
    func blogsDidRecieve(_ blogs: [Blog]) {
        let section = StandartBlogSectionViewModel()
        blogs.forEach{ section.rows.append(StandartBlogCellViewModel.init(blog: $0))}
        view?.reloadData(for: section)
    }
    
    func blogDidRecieve(_ blog: Blog) {
        router.openBlogViewController(with: blog)
    }
    
}
