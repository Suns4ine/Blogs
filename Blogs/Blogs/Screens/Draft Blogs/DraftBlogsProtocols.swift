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
}

protocol DraftBlogsViewOutput: class {
    func didTapBackButton()
    func didTapDraftTableViewCell()
}

protocol DraftBlogsInteractorInput: class {
}

protocol DraftBlogsInteractorOutput: class {
}

protocol DraftBlogsRouterInput: class {
    func popViewController()
}
