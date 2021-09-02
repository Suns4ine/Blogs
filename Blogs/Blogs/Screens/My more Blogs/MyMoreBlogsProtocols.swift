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
    func clearTableCell(at indexPath: IndexPath)
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol MyMoreBlogsViewOutput: class {
    func fetchBlogsCell()
    func didTapBackButton()
    func didTapMyBlogsTableViewCell(at indexPath: IndexPath)
    func deleteTableViewCell(at indexPath: IndexPath)
}

protocol MyMoreBlogsInteractorInput: class {
    func deleteBlog(at indexPath: IndexPath)
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol MyMoreBlogsInteractorOutput: class {
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
    func indexDeleteReiceve(_ indexPath: IndexPath)
}

protocol MyMoreBlogsRouterInput: class {
    func popViewController()
    func openBlogViewController(with blog: Blog)
}
