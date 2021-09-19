//
//  PasswordChangeInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class PasswordChangeInteractor {
	weak var output: PasswordChangeInteractorOutput?
    
    private var oldPassword = ""
    private var repeatPassword = ""
    private var newPassword = ""
    
    private func checkNewPassword(pass: String) -> Bool {
        let text = pass.trimmingCharacters(in: .whitespaces)
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorNewPassword(text: StandartLanguage.newPasswordIsEmptyPasswordChangeScreen)
            return false
        case let text where text == oldPassword:
            output?.transferErrorNewPassword(text: StandartLanguage.newPasswordEqualityPasswordChangeScreen)
            return false
        case let text where text.count < 6:
            output?.transferErrorNewPassword(text: StandartLanguage.newPasswordLittlePasswordChangeScreen)
            return false
        case let text where text.count > 40:
            output?.transferErrorNewPassword(text: StandartLanguage.newPasswordMorePasswordChangeScreen)
            return false
        default:
            newPassword = text
            output?.transferErrorNewPassword(text: "")
            return true
        }
    }
    
    private func checkRepeatPassword(pass: String) -> Bool {
        let text = pass.trimmingCharacters(in: .whitespaces)
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorRepeatPassword(text: StandartLanguage.repeatPasswordIsEmptyPasswordChangeScreen)
            return false
        case let text where text != newPassword:
            output?.transferErrorRepeatPassword(text: StandartLanguage.repeatPasswordNotEqualityPasswordChangeScreen)
            return false
        default:
            output?.transferErrorRepeatPassword(text: "")
            return true
        }
    }
    
    private func resetSignIn(pass: String) {
        
        //Повторно авторизируем пользователя, чтобы в дальнейшем изменить его пароль
        UserManager.resetSignIn(pass: pass,
                                failClosure: { [weak self] in
                                    self?.output?.transferErrorOldPassword(text: StandartLanguage.oldPasswordNotCorrectPasswordChangeScreen)
                                },
                                sucsessClosure: { [weak self] in
                                    self?.output?.transferErrorOldPassword(text: "")

                                    guard let newPassword = self?.newPassword else { return }
                                    guard let repeatPassword = self?.repeatPassword else { return }
                                    
                                    if self?.checkNewPassword(pass: newPassword) ?? false,
                                       self?.checkRepeatPassword(pass: repeatPassword) ?? false {
                                        self?.updatePassword(pass: newPassword)
                                    }
                                })
    }
    
    private func updatePassword(pass: String) {
        UserManager.updatePassword(pass: pass,
                                   failClosure: { [weak self] in
                                    self?.output?.transferErrorOldPassword(text: StandartLanguage.errorUpdatePasswordPasswordChangeScreen)
                                   },
                                   sucsessClosure: { [weak self] in
                                    self?.output?.openBackViewController()
                                   })
    }
}

extension PasswordChangeInteractor: PasswordChangeInteractorInput {
    func backController() {
        output?.openBackViewController()
    }
    
    func giveOldPasswordText(text: String) {
        oldPassword = text
    }
    
    func newPasswordText(text: String) {
        newPassword = text
    }
    
    func newRepeatPasswordText(text: String) {
        repeatPassword = text
    }
    
    func verificationOfEnteredData() {
        resetSignIn(pass: oldPassword)
    }
}
