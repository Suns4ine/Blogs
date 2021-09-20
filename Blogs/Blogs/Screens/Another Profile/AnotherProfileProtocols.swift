//
//  AnotherProfileProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

protocol AnotherProfileModuleInput {
	var moduleOutput: AnotherProfileModuleOutput? { get }
    func openUser(user: User)
}

protocol AnotherProfileModuleOutput: class {
}

protocol AnotherProfileViewInput: class {
    func updateViews(profile: User)
    func updateStatusSubscribe(text: String)
    func reloadData(for section: StandartBlogSectionViewModel)
}

protocol AnotherProfileViewOutput: class {
    func statusSubscribe()
    func setupTextInViews()
    func giveTableHeight() -> Int
    func fetchBlogsCell()
    func didTapBackButton()
    func didTapFollowButton()
    func didTapMoreBlogButton()
    func didTapBlogTableViewCell(at indexPath: IndexPath)
}

protocol AnotherProfileInteractorInput: class {
    func getBlogs()
    func setupUser(user: User)
    func giveStatus()
    func subscribe()
    func giveAnotherProfile()
    func giveBlogsArrayCount() -> Int
    func getBlog(at indexPath: IndexPath)
    func fetchBlogs()
}

protocol AnotherProfileInteractorOutput: class {
    func openAnotherMoreBlogsblogs(blogs: [Blog])
    func updateStatus(text: String)
    func giveAwayAnotherProfile(profile: User)
    func blogsDidRecieve(_ blogs: [Blog])
    func blogDidRecieve(_ blog: Blog)
}

protocol AnotherProfileRouterInput: class {
    func popViewController()
    func openAnotherMoreBlogsViewController(blogs: [Blog])
    func openBlogViewController(with blog: Blog)
}
