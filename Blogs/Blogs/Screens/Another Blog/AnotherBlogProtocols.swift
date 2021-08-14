//
//  AnotherBlogProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

protocol AnotherBlogModuleInput {
	var moduleOutput: AnotherBlogModuleOutput? { get }
}

protocol AnotherBlogModuleOutput: class {
}

protocol AnotherBlogViewInput: class {
}

protocol AnotherBlogViewOutput: class {
}

protocol AnotherBlogInteractorInput: class {
}

protocol AnotherBlogInteractorOutput: class {
}

protocol AnotherBlogRouterInput: class {
}
