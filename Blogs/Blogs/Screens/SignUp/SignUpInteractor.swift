//
//  SignUpInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Foundation

final class SignUpInteractor {
	weak var output: SignUpInteractorOutput?
    
    private var name: String = ""
    private var mail: String = ""
    private var password: String = ""
    
    private func checkName(name: String) -> Bool {
        let text = name.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorName(text: "Пустой поле имя")
            return false
        case let text where text.count < 6:
            output?.transferErrorName(text: "Минимум 6 символов")
            return false
        case let text where text.count > 25:
            output?.transferErrorName(text: "Максимум 25 символов")
            return false
        default:
            output?.transferErrorName(text: "")
            return true
        }
    }
    
    private func checkMail(mail: String) -> Bool {
        let text = mail.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorMail(text: "Пустое поле почты")
            return false
        case let text where (text.rangeOfCharacter(from: CharacterSet(charactersIn: "@")) == nil):
            output?.transferErrorMail(text: "Не корректная почта")
            return false
        default:
            output?.transferErrorMail(text: "")
            return true
        }
    }
    
    private func checkPassword(pass: String) -> Bool {
        let text = pass.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorPassword(text: "Пустой Пароль")
            return false
        case let text where text.count < 6:
            output?.transferErrorPassword(text: "Минимум 6 символов")
            return false
        case let text where text.count > 40:
            output?.transferErrorPassword(text: "Максимум 40 символов")
            return false
        default:
            output?.transferErrorPassword(text: "")
            return true
        }
    }
}

extension SignUpInteractor: SignUpInteractorInput {
    
    func verificationOfEnteredData() {
        
        if checkName(name: name),
           checkMail(mail: mail),
           checkPassword(pass: password) {
            output?.openTabBar()
        }
        
    }
    
    func newNameText(text: String) {
        name = text
        debugPrint("name - \(text)")
    }
    
    func newMailText(text: String) {
        mail = text
        debugPrint("mail - \(text)")
    }
    
    func newPasswordText(text: String) {
        password = text
        debugPrint("password - \(text)")
    }
    
}
