//
//  HomeProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

protocol HomeModuleInput {
	var moduleOutput: HomeModuleOutput? { get }
}

protocol HomeModuleOutput: class {
}

protocol HomeViewInput: class {
    func reloadData(for section: BlogSectionViewModel)
}

protocol HomeViewOutput: class {
    func fetchBlogsCell()
    func didTapSettingButton()
    func didTapBellButton()
    func didTapBlogsTableViewCell(at indexPath: IndexPath)
    func didTapAvatarTableViewCell(at indexPath: Int)
}

protocol HomeInteractorInput: class {
    func getUser(at indexPath: Int)
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol HomeInteractorOutput: class {
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
    func userDidRecieve(_ user: User)
}

protocol HomeRouterInput: class {
    func openSettingViewController()
    func openProfileController(with user: User)
    func openBlogViewController(with blog: Blog)
}
