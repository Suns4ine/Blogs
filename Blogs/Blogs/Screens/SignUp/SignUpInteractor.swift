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
    
    private var mail: String = ""
    private var password: String = ""
    private var tagname: String = "" {
        didSet {
            tagname = tagname.lowercased()
        }
    }
    
    private func checkTagname(tagname: String) -> Bool {
        let text = tagname.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorName(text: StandartLanguage.errorTagnameIsEmptySignUpScreen)
            return false
        case let text where text.count < 6:
            output?.transferErrorName(text: StandartLanguage.errorTagnameLittleSignUpScreen)
            return false
        case let text where text.count > 25:
            output?.transferErrorName(text: StandartLanguage.errorTagnameMoreSignUpScreen)
            return false
        default:
            self.tagname = text
            output?.transferErrorName(text: "")
            return true
        }
    }
    
    private func checkMail(mail: String) -> Bool {
        let text = mail.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorMail(text: StandartLanguage.errorMailIsEmptySignUpScreen)
            return false
        case let text where (text.rangeOfCharacter(from: CharacterSet(charactersIn: "@")) == nil):
            output?.transferErrorMail(text: StandartLanguage.errorMailNotCorrectSignUpScreen)
            return false
        default:
            self.mail = text
            output?.transferErrorMail(text: "")
            return true
        }
    }
    
    private func checkPassword(pass: String) -> Bool {
        let text = pass.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorPassword(text: StandartLanguage.errorPasswordIsEmptySignUpScreen)
            return false
        case let text where text.count < 6:
            output?.transferErrorPassword(text: StandartLanguage.errorPasswordLittleSignUpScreen)
            return false
        case let text where text.count > 40:
            output?.transferErrorPassword(text: StandartLanguage.errorPasswordMoreSignUpScreen)
            return false
        default:
            self.password = text
            output?.transferErrorPassword(text: "")
            return true
        }
    }
    
    private func registerUser() {
        
        let newUser = User.returnNewUser()
        newUser.mail = mail
        newUser.tagname = tagname
        
        UserManager.registerUser(user: newUser,
                                 pass: password,
                                 failClosure: { [weak self] (error) in
                                    switch error {
                                    case 1: self?.output?.transferErrorName(text: StandartLanguage.errorRegisterOneSignUpScreen)
                                    case 2: self?.output?.transferErrorName(text: StandartLanguage.errorRegisterTwoSignUpScreen)
                                    case 3: self?.output?.transferErrorName(text: StandartLanguage.errorRegisterThreeSignUpScreen)
                                    default: return
                                    }
                                 },
                                 sucsessClosure: { [weak self] in
                                    self?.output?.openTabBar()
                                 })
    }
}

extension SignUpInteractor: SignUpInteractorInput {
    
    func verificationOfEnteredData() {
        if checkTagname(tagname: tagname),
           checkMail(mail: mail),
           checkPassword(pass: password) {
            registerUser()
        }
    }
    
    func newNameText(text: String) {
        tagname = text
    }
    
    func newMailText(text: String) {
        mail = text
    }
    
    func newPasswordText(text: String) {
        password = text
    }
}
