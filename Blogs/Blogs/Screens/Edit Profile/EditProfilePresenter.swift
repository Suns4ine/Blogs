//
//  EditProfilePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class EditProfilePresenter {
	weak var view: EditProfileViewInput?
    weak var moduleOutput: EditProfileModuleOutput?

	private let router: EditProfileRouterInput
	private let interactor: EditProfileInteractorInput

    init(router: EditProfileRouterInput, interactor: EditProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension EditProfilePresenter: EditProfileModuleInput {
}

extension EditProfilePresenter: EditProfileViewOutput {
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapEditAvatarButton() {
        debugPrint("didTapEditAvatarButton")
    }
    
    func didTapSaveButton() {
        router.popViewController()
    }
    
}

extension EditProfilePresenter: EditProfileInteractorOutput {
}
