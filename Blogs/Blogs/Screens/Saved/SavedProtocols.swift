//
//  SavedProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

protocol SavedModuleInput {
	var moduleOutput: SavedModuleOutput? { get }
}

protocol SavedModuleOutput: class {
}

protocol SavedViewInput: class {
    func clearTableCell(at indexPath: IndexPath)
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol SavedViewOutput: class {
    func fetchBlogsCell()
    func didTapSettingButton()
    func didTapSavedTableViewCell(at indexPath: IndexPath)
    func deleteTableViewCell(at indexPath: IndexPath)
}

protocol SavedInteractorInput: class {
    func deleteBlog(at indexPath: IndexPath)
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol SavedInteractorOutput: class {
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
    func indexDeleteReiceve(_ indexPath: IndexPath)
}

protocol SavedRouterInput: class {
    func openSettingViewController()
    func openBlogViewController(with blog: Blog)
}
