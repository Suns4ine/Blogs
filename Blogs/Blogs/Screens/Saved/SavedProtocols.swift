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
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol SavedViewOutput: class {
    func fetchBlogsCell()
    func didTapSettingButton()
    func didTapBlogsTableViewCell(at indexPath: IndexPath)
}

protocol SavedInteractorInput: class {
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol SavedInteractorOutput: class {
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
}

protocol SavedRouterInput: class {
    func openSettingViewController()
    func openBlogViewController(with blog: Blog)
}
