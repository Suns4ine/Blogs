//
//  AnotherMoreBlogsProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

protocol AnotherMoreBlogsModuleInput {
	var moduleOutput: AnotherMoreBlogsModuleOutput? { get }
    func getArrayBlogs(array: [Blog])
}

protocol AnotherMoreBlogsModuleOutput: class {
}

protocol AnotherMoreBlogsViewInput: class {
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol AnotherMoreBlogsViewOutput: class {
    func fetchBlogsCell()
    func didTapBackButton()
    func didTapAnotherBlogsTableViewCell(at indexPath: IndexPath)
}

protocol AnotherMoreBlogsInteractorInput: class {
    func setupArrayBlogs(array: [Blog])
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol AnotherMoreBlogsInteractorOutput: class {
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
}

protocol AnotherMoreBlogsRouterInput: class {
    func popViewController()
    func openBlogViewController(with blog: Blog)
}
