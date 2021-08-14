//
//  CreateBlogProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

protocol CreateBlogModuleInput {
	var moduleOutput: CreateBlogModuleOutput? { get }
}

protocol CreateBlogModuleOutput: class {
}

protocol CreateBlogViewInput: class {
}

protocol CreateBlogViewOutput: class {
}

protocol CreateBlogInteractorInput: class {
}

protocol CreateBlogInteractorOutput: class {
}

protocol CreateBlogRouterInput: class {
}
