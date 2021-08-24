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
}

protocol MyMoreBlogsViewOutput: class {
}

protocol MyMoreBlogsInteractorInput: class {
}

protocol MyMoreBlogsInteractorOutput: class {
}

protocol MyMoreBlogsRouterInput: class {
}
