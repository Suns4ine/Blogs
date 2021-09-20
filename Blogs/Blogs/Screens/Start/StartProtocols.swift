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
    func statusUser()
    func didTapEmailButton()
    func didTapFacebookButton()
    func didTapTwitterButton()
}

protocol StartInteractorInput: class {
}

protocol StartInteractorOutput: class {
}

protocol StartRouterInput: class {
    func openLoginViewController()
}
