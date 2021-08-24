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
}

protocol AnotherMoreBlogsModuleOutput: class {
}

protocol AnotherMoreBlogsViewInput: class {
}

protocol AnotherMoreBlogsViewOutput: class {
    func didTapBackButton()
    func didTapAnotherBlogsTableViewCell()
}

protocol AnotherMoreBlogsInteractorInput: class {
}

protocol AnotherMoreBlogsInteractorOutput: class {
}

protocol AnotherMoreBlogsRouterInput: class {
    func popViewController()
}
