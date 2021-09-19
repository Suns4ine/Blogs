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
            output?.transferErrorNewPassword(text: "Пустое поле")
            return false
        case let text where text == oldPassword:
            output?.transferErrorNewPassword(text: "Совпадает со старым паролем")
            return false
        case let text where text.count < 6:
            output?.transferErrorNewPassword(text: "Минимум 6 символов")
            return false
        case let text where text.count > 40:
            output?.transferErrorNewPassword(text: "Максимум 40 символов")
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
            output?.transferErrorRepeatPassword(text: "Пустое поле")
            return false
        case let text where text != newPassword:
            output?.transferErrorRepeatPassword(text: "Пароли не совпадают")
            return false
        default:
            output?.transferErrorRepeatPassword(text: "")
            return true
        }
    }
    
    private func resetSignIn(pass: String) {

        UserManager.resetSignIn(pass: pass,
                                failClosure: { [weak self] in
                                    self?.output?.transferErrorOldPassword(text: "Не правильный пароль")
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
                                    self?.output?.transferErrorOldPassword(text: "Ошибка смены пароля")
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
