//
//  LoginInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Foundation

final class LoginInteractor {
	weak var output: LoginInteractorOutput?
    private var login: String = ""
    private var password: String = ""
    
    private func checkLogin(login: String) -> Bool {
        let text = login.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorLogin(text: "Пустой логин")
            return false
        case let text where (text.rangeOfCharacter(from: CharacterSet(charactersIn: "@")) == nil):
            output?.transferErrorLogin(text: "Не корректный логин")
            return false
        default:
            output?.transferErrorLogin(text: "")
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
            output?.transferErrorPassword(text: "Не корректный Пароль")
            return false
        default:
            output?.transferErrorPassword(text: "")
            return true
        }
    }
}

extension LoginInteractor: LoginInteractorInput {
    
    func verificationOfEnteredData() {
        
        if checkLogin(login: login) && checkPassword(pass: password) {
            output?.openTabBar()
        }
        
    }
    
    func newLoginText(text: String) {
        login = text
    }
    
    func newPasswordText(text: String) {
        password = text
    }
    
}
