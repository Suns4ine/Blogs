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
    private var newPassword = ""
    private var repeatPassword = ""
    
    private func checkOldPassword(pass: String) -> Bool {
        let text = pass.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorOldPassword(text: "Пустое поле")
            return false
        case let text where text != defaultUser.password:
            output?.transferErrorOldPassword(text: "Не совпадают пароли")
            return false
        default:
            output?.transferErrorOldPassword(text: "")
            return true
        }
    }
    
    private func checkNewPassword(pass: String) -> Bool {
        let text = pass.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorNewPassword(text: "Пустое поле")
            return false
        case let text where text == defaultUser.password:
            output?.transferErrorNewPassword(text: "Совпадает со старым паролем")
            return false
        case let text where text.count < 6:
            output?.transferErrorNewPassword(text: "Минимум 6 символов")
            return false
        case let text where text.count > 40:
            output?.transferErrorNewPassword(text: "Максимум 40 символов")
            return false
        default:
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
    
}

//MARK: Убрать дефолтного юзера
extension PasswordChangeInteractor: PasswordChangeInteractorInput {
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
        
        if checkOldPassword(pass: oldPassword),
           checkNewPassword(pass: newPassword),
           checkRepeatPassword(pass: repeatPassword) {
            
            defaultUser.password = newPassword
            output?.openBackViewController()
        }
    }
    
}
