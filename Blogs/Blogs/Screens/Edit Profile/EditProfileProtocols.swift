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
    func updateViews(profile: User)
    func showErrorName(text: String)
    func showErrorSurname(text: String)
    func showErrorTagName(text: String)
    func showErrorAboutMe(text: String)
}

protocol EditProfileViewOutput: class {
    func didFinishNameText(text: String)
    func didFinishSurnameText(text: String)
    func didFinishTagNameText(text: String)
    func didFinishAboutMeText(text: String)
    func setupTextInViews()
    func didTapBackButton()
    func didTapEditAvatarButton()
    func didTapSaveButton()
}

protocol EditProfileInteractorInput: class {
    func giveMyProfile()
    func newNameText(text: String)
    func newSurnameText(text: String)
    func newTagNameText(text: String)
    func newAboutMeText(text: String)
    func verificationOfEnteredData()
}

protocol EditProfileInteractorOutput: class {
    func giveAwayMyProfile(profile: User)
    func openBackViewController()
    func transferErrorName(text: String)
    func transferErrorSurname(text: String)
    func transferErrorTagName(text: String)
    func transferErrorAboutMe(text: String)
}

protocol EditProfileRouterInput: class {
    func popViewController()
}
