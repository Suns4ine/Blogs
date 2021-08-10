//
//  LoginProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Foundation

protocol LoginModuleInput {
	var moduleOutput: LoginModuleOutput? { get }
}

protocol LoginModuleOutput: class {
}

protocol LoginViewInput: class {
}

protocol LoginViewOutput: class {
}

protocol LoginInteractorInput: class {
}

protocol LoginInteractorOutput: class {
}

protocol LoginRouterInput: class {
}
