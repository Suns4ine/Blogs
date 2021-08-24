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
}

protocol PasswordChangeViewOutput: class {
    func didTapBackButton()
    func didTapSaveButton()
}

protocol PasswordChangeInteractorInput: class {
}

protocol PasswordChangeInteractorOutput: class {
}

protocol PasswordChangeRouterInput: class {
    func popViewController()
}
