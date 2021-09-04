//
//  MyProfileProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import Foundation

protocol MyProfileModuleInput {
	var moduleOutput: MyProfileModuleOutput? { get }
}

protocol MyProfileModuleOutput: class {
}

protocol MyProfileViewInput: class {
    func clearTableCell(at indexPath: IndexPath)
    func updateViews(profile: User)
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol MyProfileViewOutput: class {
    func setupTextInViews()
    func giveTableHeight() -> Int
    func fetchBlogsCell()
    func didTapSettingButton()
    func didTapEditButton()
    func didTapCreateBolgButton()
    func didTapMoreBlogButton()
    func didTapBlogTableViewCell(at indexPath: IndexPath)
    func deleteTableViewCell(at indexPath: IndexPath)
}

protocol MyProfileInteractorInput: class {
    func deleteBlog(at indexPath: IndexPath)
    func giveMyProfile()
    func giveBlogsArrayCount() -> Int
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol MyProfileInteractorOutput: class {
    func giveAwayMyProfile(profile: User)
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
    func indexDeleteReiceve(_ indexPath: IndexPath)
}

protocol MyProfileRouterInput: class {
    func openSettingViewController()
    func openEditProfileViewController()
    func openCreateBlogViewController()
    func openMyMoreBlogsViewController()
    func openBlogViewController(with blog: Blog)
}
