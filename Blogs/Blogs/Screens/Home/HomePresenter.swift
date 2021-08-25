//
//  HomePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

final class HomePresenter {
	weak var view: HomeViewInput?
    weak var moduleOutput: HomeModuleOutput?

	private let router: HomeRouterInput
	private let interactor: HomeInteractorInput

    init(router: HomeRouterInput, interactor: HomeInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter: HomeModuleInput {
}

extension HomePresenter: HomeViewOutput {
    func fetchBlogsCell() {
        interactor.fetchBlogs()
    }
    
    func didTapBellButton() {
        debugPrint("didTapBellButton")
    }
    
    func didTapSettingButton() {
        router.openSettingViewController()
    }
    
    func didTapBlogsTableViewCell(at indexPath: IndexPath) {
        debugPrint("didTapBlogsTableViewCell")
        interactor.getBlog(at: indexPath)
    }
    
    func didTapAvatarTableViewCell(at indexPath: Int) {
        debugPrint(indexPath)
        interactor.getUser(at: indexPath)
    }
    
}

extension HomePresenter: HomeInteractorOutput {
    func blogDidRecieve(_ blog: Blog) {
        router.openBlogViewController(with: blog)
    }
    
    func blogsDidRecieve(_ blogs: [Blog]) {
        let section = BlogSectionViewModel()
        blogs.forEach{ section.rows.append(BlogCellViewModel.init(blog: $0))}
        view?.reloadData(for: section)
    }
    
    func userDidRecieve(_ user: User) {
        router.openAnotherProfileController(with: user)
    }
    
}
