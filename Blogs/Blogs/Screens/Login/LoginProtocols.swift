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
    func didTapBackButton()
    func didTapSignInButton()
    func didTapSignUpButton()
}

protocol LoginInteractorInput: class {
}

protocol LoginInteractorOutput: class {
}

protocol LoginRouterInput: class {
    func popViewController()
    func openTabBarViewController()
    func openSignUpViewController()
}
