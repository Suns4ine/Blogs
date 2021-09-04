//
//  DraftBlogsProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

protocol DraftBlogsModuleInput {
	var moduleOutput: DraftBlogsModuleOutput? { get }
}

protocol DraftBlogsModuleOutput: class {
}

protocol DraftBlogsViewInput: class {
    func clearTableCell(at indexPath: IndexPath)
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol DraftBlogsViewOutput: class {
    func fetchBlogsCell()
    func didTapBackButton()
    func didTapDraftTableViewCell(at indexPath: IndexPath)
    func deleteTableViewCell(at indexPath: IndexPath)
}

protocol DraftBlogsInteractorInput: class {
    func deleteBlog(at indexPath: IndexPath)
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
    
}

protocol DraftBlogsInteractorOutput: class {
    func blogsDidRecieve(_ blogs: [Blog])
    func indexDeleteReiceve(_ indexPath: IndexPath)
    func openBackController()
}

protocol DraftBlogsRouterInput: class {
    func popViewController()
}
