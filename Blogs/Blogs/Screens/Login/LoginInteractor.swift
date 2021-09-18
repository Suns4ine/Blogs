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
                        self?.updateDataUser(document: document)
                        self?.output?.openTabBar()
                    }
                }
            }
        }
    }
    
    private func updateDataUser(document: [String : Any]) {
        UserManager.setUser(document: document)
    }
}

extension LoginInteractor: LoginInteractorInput {
    
    func verificationOfEnteredData() {
        
        if checkLogin(login: login),
           checkPassword(pass: password) {
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
