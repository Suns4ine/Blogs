//
//  HelpProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

protocol HelpModuleInput {
	var moduleOutput: HelpModuleOutput? { get }
}

protocol HelpModuleOutput: class {
}

protocol HelpViewInput: class {
}

protocol HelpViewOutput: class {
}

protocol HelpInteractorInput: class {
}

protocol HelpInteractorOutput: class {
}

protocol HelpRouterInput: class {
}
