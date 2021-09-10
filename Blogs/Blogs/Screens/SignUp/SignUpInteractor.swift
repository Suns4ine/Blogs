//
//  SignUpInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Firebase
import Foundation
import FirebaseAuth

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
            self.name = text
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
            self.mail = text
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
            self.password = text
            output?.transferErrorPassword(text: "")
            return true
        }
    }
    
    private func registerUser() {
        
            // Create the user
            Auth.auth().createUser(withEmail: mail, password: password) { [weak self] (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self?.output?.transferErrorName(text: "Ошибка создания пользователя")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    guard result != nil else { return }
                    
                    
                    let newUser = User(dateCreate: .init(),
                                       mail: self?.mail ?? "",
                                       password: "",
                                       identifier: "",
                                       name: self?.name ?? "",
                                       surname: "",
                                       tagname: "",
                                       arrayBlogs: [],
                                       arrayDrafts: [],
                                       arrayLikedBlogs: [],
                                       arrayFollowers: [],
                                       arrayFolloving: [],
                                       aboutMe: "",
                                       avatar: .init(),
                                       personalSetting: PersonalSetting(sound: true,
                                                                        notification: true,
                                                                        language: .rus,
                                                                        theme: .standart,
                                                                        cache: ""))
                    
                    db.collection("users").addDocument(data: [  "name": newUser.name,
                                                                "surname": newUser.surname,
                                                                "tagname": newUser.tagname,
                                                                "mail": newUser.mail,
                                                                "aboutMe": newUser.aboutMe,
                                                                "uid": result!.user.uid ]) { (error) in

                        if error != nil {
                            // Show error message
                            self?.output?.transferErrorName(text: "Ошибка сохранения данных")
                        }
                    }
                    
                    defaultUser = newUser
                    self?.output?.openTabBar()
                }
                
            }
            
    }
}

extension SignUpInteractor: SignUpInteractorInput {
    
    func verificationOfEnteredData() {
        
        if checkName(name: name),
           checkMail(mail: mail),
           checkPassword(pass: password) {
            registerUser()
        }
        
    }
    
    func newNameText(text: String) {
        name = text
    }
    
    func newMailText(text: String) {
        mail = text
    }
    
    func newPasswordText(text: String) {
        password = text
    }
    
}
