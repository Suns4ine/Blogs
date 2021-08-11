//
//  HomeProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

protocol HomeModuleInput {
	var moduleOutput: HomeModuleOutput? { get }
}

protocol HomeModuleOutput: class {
}

protocol HomeViewInput: class {
}

protocol HomeViewOutput: class {
}

protocol HomeInteractorInput: class {
}

protocol HomeInteractorOutput: class {
}

protocol HomeRouterInput: class {
}
