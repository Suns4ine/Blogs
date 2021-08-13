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
}

protocol AnotherProfileModuleOutput: class {
}

protocol AnotherProfileViewInput: class {
}

protocol AnotherProfileViewOutput: class {
}

protocol AnotherProfileInteractorInput: class {
}

protocol AnotherProfileInteractorOutput: class {
}

protocol AnotherProfileRouterInput: class {
}