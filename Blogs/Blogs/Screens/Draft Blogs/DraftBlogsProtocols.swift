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
}

protocol DraftBlogsInteractorInput: class {
}

protocol DraftBlogsInteractorOutput: class {
}

protocol DraftBlogsRouterInput: class {
}
