//
//  SearchProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation

protocol SearchModuleInput {
	var moduleOutput: SearchModuleOutput? { get }
}

protocol SearchModuleOutput: class {
}

protocol SearchViewInput: class {
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol SearchViewOutput: class {
    func searchWord(word: String)
    func fetchBlogsCell()
    func didTapSettingButton()
    func didTapSearchTableViewCell(at indexPath: IndexPath)
}

protocol SearchInteractorInput: class {
    func getWord(word: String)
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol SearchInteractorOutput: class {
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
}

protocol SearchRouterInput: class {
    func openSettingViewController()
    func openBlogViewController(with blog: Blog)
}
