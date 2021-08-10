//
//  StartProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Foundation

protocol StartModuleInput {
	var moduleOutput: StartModuleOutput? { get }
}

protocol StartModuleOutput: class {
}

protocol StartViewInput: class {
}

protocol StartViewOutput: class {
}

protocol StartInteractorInput: class {
}

protocol StartInteractorOutput: class {
}

protocol StartRouterInput: class {
}
