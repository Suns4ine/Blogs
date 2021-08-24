//
//  SignUpProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Foundation

protocol SignUpModuleInput {
	var moduleOutput: SignUpModuleOutput? { get }
}

protocol SignUpModuleOutput: class {
}

protocol SignUpViewInput: class {
}

protocol SignUpViewOutput: class {
    func didTapBackButton()
    func didTapRegisterButton()
}

protocol SignUpInteractorInput: class {
}

protocol SignUpInteractorOutput: class {
}

protocol SignUpRouterInput: class {
    func openTabBarViewController()
    func popViewController()
}
