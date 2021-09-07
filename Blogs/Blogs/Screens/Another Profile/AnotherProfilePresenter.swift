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
//MARK: Убрать дефолтный блог в giveTableHeight
extension AnotherProfilePresenter: AnotherProfileViewOutput {
    func statusSubscribe() {
        interactor.giveStatus()
    }
    
    func setupTextInViews() {
        interactor.giveAnotherProfile()
    }
    
    func giveTableHeight() -> Int {
        let count = interactor.giveBlogsArrayCount()
        let cellHeight = Int(StandartBlogCellViewModel.init(blog: defaultBlog).cellHeight)
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
        interactor.subscribe()
    }
    
    func didTapMoreBlogButton() {
        router.openAnotherMoreBlogsViewController()
    }
    
}

extension AnotherProfilePresenter: AnotherProfileInteractorOutput {
    func updateStatus(text: String) {
        view?.updateStatusSubscribe(text: text)
    }
    
    func giveAwayAnotherProfile(profile: User) {
        view?.updateViews(profile: profile)
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
