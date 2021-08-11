//
//  SavedProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

protocol SavedModuleInput {
	var moduleOutput: SavedModuleOutput? { get }
}

protocol SavedModuleOutput: class {
}

protocol SavedViewInput: class {
}

protocol SavedViewOutput: class {
}

protocol SavedInteractorInput: class {
}

protocol SavedInteractorOutput: class {
}

protocol SavedRouterInput: class {
}
