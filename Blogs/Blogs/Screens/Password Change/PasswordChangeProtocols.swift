//
//  PasswordChangeProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

protocol PasswordChangeModuleInput {
	var moduleOutput: PasswordChangeModuleOutput? { get }
}

protocol PasswordChangeModuleOutput: class {
}

protocol PasswordChangeViewInput: class {
    func showErrorOldPassword(text: String)
    func showErrorNewPassword(text: String)
    func showErrorRepeatPassword(text: String)
}

protocol PasswordChangeViewOutput: class {
    func didFinishOldPasswordText(text: String)
    func didFinishNewPasswordText(text: String)
    func didFinishRepeatPasswordText(text: String)
    func didTapBackButton()
    func didTapSaveButton()
}

protocol PasswordChangeInteractorInput: class {
    func giveOldPasswordText(text: String)
    func newPasswordText(text: String)
    func newRepeatPasswordText(text: String)
    func verificationOfEnteredData()
}

protocol PasswordChangeInteractorOutput: class {
    func transferErrorOldPassword(text: String)
    func transferErrorNewPassword(text: String)
    func transferErrorRepeatPassword(text: String)
    func openBackViewController()
}

protocol PasswordChangeRouterInput: class {
    func popViewController()
}
