//
//  MyProfilePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import Foundation

final class MyProfilePresenter {
	weak var view: MyProfileViewInput?
    weak var moduleOutput: MyProfileModuleOutput?

	private let router: MyProfileRouterInput
	private let interactor: MyProfileInteractorInput

    init(router: MyProfileRouterInput, interactor: MyProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MyProfilePresenter: MyProfileModuleInput {
}

extension MyProfilePresenter: MyProfileViewOutput {
    
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
    
    func didTapSettingButton() {
        router.openSettingViewController()
    }
    
    func didTapEditButton() {
        router.openEditProfileViewController()
    }
    
    func didTapCreateBolgButton() {
        router.openCreateBlogViewController()
    }
    
    func didTapMoreBlogButton() {
        router.openMyMoreBlogsViewController()
    }
    
}

extension MyProfilePresenter: MyProfileInteractorOutput {
    func blogsDidRecieve(_ blogs: [Blog]) {
        let section = StandartBlogSectionViewModel()
        blogs.forEach{ section.rows.append(StandartBlogCellViewModel.init(blog: $0))}
        view?.reloadData(for: section)
    }
    
    func blogDidRecieve(_ blog: Blog) {
        router.openBlogViewController(with: blog)
    }
    
}
