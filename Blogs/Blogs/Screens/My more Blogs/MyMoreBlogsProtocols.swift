//
//  MyMoreBlogsProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

protocol MyMoreBlogsModuleInput {
	var moduleOutput: MyMoreBlogsModuleOutput? { get }
}

protocol MyMoreBlogsModuleOutput: class {
}

protocol MyMoreBlogsViewInput: class {
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol MyMoreBlogsViewOutput: class {
    func fetchBlogsCell()
    func didTapBackButton()
    func didTapMyBlogsTableViewCell(at indexPath: IndexPath)
}

protocol MyMoreBlogsInteractorInput: class {
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol MyMoreBlogsInteractorOutput: class {
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
}

protocol MyMoreBlogsRouterInput: class {
    func popViewController()
    func openBlogViewController(with blog: Blog)
}
