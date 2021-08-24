//
//  EditProfileProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

protocol EditProfileModuleInput {
	var moduleOutput: EditProfileModuleOutput? { get }
}

protocol EditProfileModuleOutput: class {
}

protocol EditProfileViewInput: class {
}

protocol EditProfileViewOutput: class {
    func didTapBackButton()
    func didTapEditAvatarButton()
    func didTapSaveButton()
}

protocol EditProfileInteractorInput: class {
}

protocol EditProfileInteractorOutput: class {
}

protocol EditProfileRouterInput: class {
    func popViewController()
}
