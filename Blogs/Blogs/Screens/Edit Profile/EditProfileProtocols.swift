//
//  EditProfileProtocols.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation
import UIKit

protocol EditProfileModuleInput {
	var moduleOutput: EditProfileModuleOutput? { get }
}

protocol EditProfileModuleOutput: class {
}

protocol EditProfileViewInput: class {
    func showAlertAvatar()
    func updateViews(profile: User)
    func showErrorName(text: String)
    func showErrorSurname(text: String)
    func showErrorTagName(text: String)
    func showErrorAboutMe(text: String)
    func newAvatar(image: UIImage)
}

protocol EditProfileViewOutput: class {
    func getAvatar(image: UIImage)
    func didTapAvatarButton()
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
    func giveAvatar(image: UIImage)
    func editAvatar()
    func giveMyProfile()
    func newNameText(text: String)
    func newSurnameText(text: String)
    func newTagNameText(text: String)
    func newAboutMeText(text: String)
    func verificationOfEnteredData()
}

protocol EditProfileInteractorOutput: class {
    func callAlertAvatar()
    func giveAwayMyProfile(profile: User)
    func openBackViewController()
    func transferAvatar(image: UIImage)
    func transferErrorName(text: String)
    func transferErrorSurname(text: String)
    func transferErrorTagName(text: String)
    func transferErrorAboutMe(text: String)
}

protocol EditProfileRouterInput: class {
    func popViewController()
}
