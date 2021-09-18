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
    
    private var tagname: String = "" {
        didSet {
            tagname = tagname.lowercased()
        }
    }
    private var mail: String = ""
    private var password: String = ""
    private let nextQueue = DispatchQueue(label: "nextQueueSignUp",
                                          qos: .userInteractive,
                                          attributes: .initiallyInactive,
                                          autoreleaseFrequency: .workItem)
    
    private func checkTagname(tagname: String) -> Bool {
        let text = tagname.trimmingCharacters(in: .whitespaces)
        
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
            self.tagname = text
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
            Auth.auth().createUser(withEmail: mail, password: password) { [weak self] (res, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    debugPrint("\(err?.localizedDescription)!")
                    self?.output?.transferErrorName(text: "Ошибка создания пользователя")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    guard let result = res else { return }
                    let createUser = newUser
                    
                    createUser.tagname = self?.tagname ?? ""
                    createUser.mail = self?.mail ?? ""
                    createUser.identifier =  String(result.user.uid)
                    createUser.randomUserAvatar()
                    
                    db.collection("users").document(result.user.uid).setData([
                        "name" : createUser.name,
                        "surname" :  createUser.surname,
                        "tagname" :  createUser.tagname,
                        "mail" : createUser.mail,
                        "dateCreate" : Date.init(),
                        "identifier" : String(result.user.uid),
                        "arrayBlogs" :  createUser.arrayBlogs,
                        "arrayDrafts" : createUser.arrayDrafts,
                        "arrayLikedBlogs" : Array(createUser.arrayLikedBlogs),
                        "arrayFollowers" : Array(createUser.arrayFollowers),
                        "arrayFolloving" : Array(createUser.arrayFolloving),
                        "aboutMe" : createUser.aboutMe,
                        "avatarURL" : createUser.avatarURL,
                        "personalSetting" : [
                            "sound" : createUser.personalSetting.sound,
                            "notification" : createUser.personalSetting.notification,
                            "language" : createUser.personalSetting.language.rawValue,
                            "theme" : createUser.personalSetting.theme.rawValue
                        ],
                        "uid": result.user.uid
                    ]) { (error) in

                        if error != nil {
                            // Show error message
                            debugPrint("\(String(describing: error?.localizedDescription))!")
                            self?.output?.transferErrorName(text: "Ошибка сохранения данных")
                        }
                    }
                    
                    defaultUser = newUser
                    self?.nextQueue.activate()
                }
                
            }
            
    }
}

extension SignUpInteractor: SignUpInteractorInput {
    
    func verificationOfEnteredData() {
        
        if checkTagname(tagname: tagname),
           checkMail(mail: mail),
           checkPassword(pass: password) {
            registerUser()
            
            nextQueue.async {
                DispatchQueue.main.async {
                    self.output?.openTabBar()
                }
            }
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
