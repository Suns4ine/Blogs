//
//  SearchPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

final class SearchPresenter {
	weak var view: SearchViewInput?
    weak var moduleOutput: SearchModuleOutput?

	private let router: SearchRouterInput
	private let interactor: SearchInteractorInput

    init(router: SearchRouterInput, interactor: SearchInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SearchPresenter: SearchModuleInput {
}

extension SearchPresenter: SearchViewOutput {
    func fetchBlogsCell() {
        interactor.fetchBlogs()
    }
    
    func didTapSearchTableViewCell(at indexPath: IndexPath) {
        interactor.getBlog(at: indexPath)
    }
    
    func didTapSettingButton() {
        router.openSettingViewController()
    }
}

extension SearchPresenter: SearchInteractorOutput {
    func blogsDidRecieve(_ blogs: [Blog]) {
        let section = StandartBlogSectionViewModel()
        blogs.forEach{ section.rows.append(StandartBlogCellViewModel.init(blog: $0))}
        view?.reloadData(for: section)
    }
    
    func blogDidRecieve(_ blog: Blog) {
        router.openBlogViewController(with: blog)
    }
    
}
