//
//  EditProfilePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation
import UIKit

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
    func getAvatar(image: UIImage) {
        interactor.giveAvatar(image: image)
    }
    
    func didTapAvatarButton() {
        interactor.editAvatar()
    }
    
    func didFinishNameText(text: String) {
        interactor.newNameText(text: text)
    }
    
    func didFinishSurnameText(text: String) {
        interactor.newSurnameText(text: text)
    }
    
    func didFinishTagNameText(text: String) {
        interactor.newTagNameText(text: text)
    }
    
    func didFinishAboutMeText(text: String) {
        interactor.newAboutMeText(text: text)
    }
    
    func setupTextInViews() {
        interactor.giveMyProfile()
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapEditAvatarButton() {
        interactor.editAvatar()
    }
    
    func didTapSaveButton() {
        interactor.verificationOfEnteredData()
        //router.popViewController()
    }
    
}

extension EditProfilePresenter: EditProfileInteractorOutput {
    func transferAvatar(image: UIImage) {
        view?.newAvatar(image: image)
    }
    
    func callAlertAvatar() {
        view?.showAlertAvatar()
    }
    
    func transferErrorName(text: String) {
        view?.showErrorName(text: text)
    }
    
    func transferErrorSurname(text: String) {
        view?.showErrorSurname(text: text)
    }
    
    func transferErrorTagName(text: String) {
        view?.showErrorTagName(text: text)
    }
    
    func transferErrorAboutMe(text: String) {
        view?.showErrorAboutMe(text: text)
    }
    
    func openBackViewController() {
        router.popViewController()
    }
    
    func giveAwayMyProfile(profile: User) {
        view?.updateViews(profile: profile)
    }
    
}
