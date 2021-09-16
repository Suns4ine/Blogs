//
//  LoginInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import Firebase
import Foundation
import FirebaseAuth
import FirebaseFirestore

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
            self.login = text
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
            password = text
            return true
        }
    }
    
    private func authUser() {
            
        // Signing in the user
        Auth.auth().signIn(withEmail: login, password: password) { [weak self] (result, error) in
            
            if error != nil {
                self?.output?.transferErrorLogin(text: "Не правильная почта либо пароль")
            }
            else {
                
                let db = Firestore.firestore()
                
                guard let res = result else { return }
                
                db.collection("users").document(res.user.uid).getDocument { (snapshot, error) in

                    if error != nil || snapshot == nil {
                        self?.output?.transferErrorLogin(text: "Ошибка получения данных")
                    } else {
                        guard let snap = snapshot,
                              snap.exists,
                              let document = snap.data() else {
                            self?.output?.transferErrorLogin(text: "Ошибка получения данных")
                            return
                        }
                        
                        self?.setUser(document: document)

                    }
                }
                
                self?.output?.openTabBar()
            }
        }
    }
    
    private func setUser(document: [String : Any ]) {
        
//        var arrayLikedBlogs = document["arrayLikedBlogs"] as? Array ?? []
//        var arrayFollowers = document["arrayFollowers"] as? Array ?? []
//        var arrayFolloving = document["arrayFolloving"] as? Array ?? []
        let personalSetting = document["personalSetting"] as? Dictionary<String, Any> ?? [:]
        let language = document["personalSetting"] as? String ?? "ErrorLanguage"
        let theme = document["theme"] as? String ?? "ErrorTheme"
        
        defaultUser.name = document["name"] as? String ?? "ErrorName"
        defaultUser.surname = document["surname"] as? String ?? "ErrorSurname"
        defaultUser.tagname = document["tagname"] as? String ?? "ErrorTagname"
        defaultUser.mail = document["mail"] as? String ?? "ErrorMail"
        defaultUser.identifier = document["identifier"] as? String ?? "ErrorIdentifier"
        defaultUser.dateCreate = document["dateCreate"] as? Date ?? .init()
        defaultUser.arrayBlogs = document["arrayBlogs"] as? Array ?? []
        defaultUser.arrayDrafts = document["arrayDrafts"] as? Array ?? []
        defaultUser.aboutMe = document["aboutMe"] as? String ?? "ErrorAboutMe"
        defaultUser.avatar = document["avatar"] as? String ?? "ErrorAvatar"

        defaultUser.personalSetting.sound = personalSetting["sound"] as? Bool ?? true
        defaultUser.personalSetting.notification = personalSetting["notification"] as? Bool ?? true
        defaultUser.personalSetting.language = LanguagesApplication(rawValue: language) ?? .en
        defaultUser.personalSetting.theme = ColorsApplication(rawValue: theme) ?? .unspecified
        
    }
}

extension LoginInteractor: LoginInteractorInput {
    
    func verificationOfEnteredData() {
        
        if checkLogin(login: login) && checkPassword(pass: password) {
            authUser()
        }
        
    }
    
    func newLoginText(text: String) {
        login = text
    }
    
    func newPasswordText(text: String) {
        password = text
    }
    
}
