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
    func showErrorName(text: String)
    func showErrorMail(text: String)
    func showErrorPassword(text: String)
}

protocol SignUpViewOutput: class {
    func didFinishNameText(text: String)
    func didFinishMailText(text: String)
    func didFinishPasswordText(text: String)
    func didTapBackButton()
    func didTapRegisterButton()
}

protocol SignUpInteractorInput: class {
    func newNameText(text: String)
    func newMailText(text: String)
    func newPasswordText(text: String)
    func verificationOfEnteredData()
}

protocol SignUpInteractorOutput: class {
    func openTabBar()
    func transferErrorName(text: String)
    func transferErrorMail(text: String)
    func transferErrorPassword(text: String)
}

protocol SignUpRouterInput: class {
    func openTabBarViewController()
    func popViewController()
}
