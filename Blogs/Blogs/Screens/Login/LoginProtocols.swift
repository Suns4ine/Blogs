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
    func showErrorLogin(text: String)
    func showErrorPassword(text: String)
}

protocol LoginViewOutput: class {
    func didFinishLoginText(text: String)
    func didFinishPasswordText(text: String)
    func didTapBackButton()
    func didTapSignInButton()
    func didTapSignUpButton()
}

protocol LoginInteractorInput: class {
    func newLoginText(text: String)
    func newPasswordText(text: String)
    func verificationOfEnteredData()
}

protocol LoginInteractorOutput: class {
    func openTabBar()
    func transferErrorLogin(text: String)
    func transferErrorPassword(text: String)
    
}

protocol LoginRouterInput: class {
    func popViewController()
    func openTabBarViewController()
    func openSignUpViewController()
}
