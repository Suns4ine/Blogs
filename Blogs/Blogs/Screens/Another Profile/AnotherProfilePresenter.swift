//
//  AnotherProfilePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class AnotherProfilePresenter {
	weak var view: AnotherProfileViewInput?
    weak var moduleOutput: AnotherProfileModuleOutput?

	private let router: AnotherProfileRouterInput
	private let interactor: AnotherProfileInteractorInput

    init(router: AnotherProfileRouterInput, interactor: AnotherProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AnotherProfilePresenter: AnotherProfileModuleInput {
}

extension AnotherProfilePresenter: AnotherProfileViewOutput {
    func giveTableHeight() -> Int {
        let count = interactor.giveBlogsArrayCount()
        let cellHeight = Int(StandartBlogCellViewModel.init(blog: .init()).cellHeight)
        return count > 3 ? 3 * cellHeight : count * cellHeight
    }
    
    func fetchBlogsCell() {
        interactor.fetchBlogs()
    }
    
    func didTapBlogTableViewCell(at indexPath: IndexPath) {
        interactor.getBlog(at: indexPath)
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapFollowButton() {
        debugPrint("didTapFollowButton")
    }
    
    func didTapMoreBlogButton() {
        router.openAnotherMoreBlogsViewController()
    }
    
}

extension AnotherProfilePresenter: AnotherProfileInteractorOutput {
    func blogsDidRecieve(_ blogs: [Blog]) {
        let section = StandartBlogSectionViewModel()
        blogs.forEach{ section.rows.append(StandartBlogCellViewModel.init(blog: $0))}
        view?.reloadData(for: section)
    }
    
    func blogDidRecieve(_ blog: Blog) {
        router.openBlogViewController(with: blog)
    }
    
}
