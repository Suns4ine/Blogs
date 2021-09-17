//
//  PasswordChangeInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation
import FirebaseAuth

final class PasswordChangeInteractor {
	weak var output: PasswordChangeInteractorOutput?
    
    private var flag = false {
        didSet {
            debugPrint("!\(flag)!")
        }
    }
    private let user = Auth.auth().currentUser
    private var oldPassword = ""
    private var repeatPassword = ""
    private var newPassword = "" {
        didSet {
            newPassword = newPassword.trimmingCharacters(in: .whitespaces)
        }
    }
    
    private func checkOldPassword(pass: String) -> Bool {
        let pass = pass.trimmingCharacters(in: .whitespaces)
        flag = false
        
        switch pass {
        case let pass where pass.isEmpty:
            output?.transferErrorOldPassword(text: "Пустое поле")
            flag = false
        default:
            break
        }
        
        flag = resetSignIn(pass: pass)
        return true
    }
    
    private func checkNewPassword(pass: String) -> Bool {
        let text = pass.trimmingCharacters(in: .whitespaces)
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorNewPassword(text: "Пустое поле")
            return false
//        case let text where text == defaultUser.password:
//            output?.transferErrorNewPassword(text: "Совпадает со старым паролем")
//            return false
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
    
    private func resetSignIn(pass: String) -> Bool {
        //flag = false
        Auth.auth().signIn(withEmail: defaultUser.mail, password: pass) { [weak self] (result, error) in
           
            if error != nil {
                self?.flag = false
                self?.output?.transferErrorOldPassword(text: "Не правильный пароль")
            } else {
                self?.flag = true
                self?.output?.transferErrorOldPassword(text: "")
            }
        }
        return flag
    }
    
    private func updatePassword(pass: String){
        Auth.auth().currentUser?.updatePassword(to: pass) { [weak self] (error) in
            if error != nil {
                self?.output?.transferErrorOldPassword(text: "Ошибка смены пароля")
            } else {
                self?.output?.openBackViewController()
            }
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
            updatePassword(pass: newPassword)
        }
    }
    
}
