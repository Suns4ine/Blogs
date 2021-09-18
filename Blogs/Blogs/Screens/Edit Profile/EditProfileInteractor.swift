//
//  EditProfileInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation
import Firebase
import FirebaseStorage

final class EditProfileInteractor {
	weak var output: EditProfileInteractorOutput?
    
    private let user = Auth.auth().currentUser
    private var avatar = defaultUser.identifier
    private var newName = defaultUser.name
    private var newSurname = defaultUser.surname
    private var newTagname = defaultUser.tagname
    private var newAboutMe = defaultUser.aboutMe
    
    private func checkName(name: String) -> Bool {
        let text = name.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorName(text: "Пустое поле")
            return false
        case let text where text.count < 4:
            output?.transferErrorName(text: "Минимум 4 символа")
            return false
        case let text where text.count > 15:
            output?.transferErrorName(text: "Максимум 15 символов")
            return false
        default:
            output?.transferErrorName(text: "")
            return true
        }
    }
    
    private func checkSurname(surname: String) -> Bool {
        let text = surname.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorSurname(text: "Пустое поле")
            return false
        case let text where text.count < 4:
            output?.transferErrorSurname(text: "Минимум 4 символа")
            return false
        case let text where text.count > 15:
            output?.transferErrorSurname(text: "Максимум 15 символов")
            return false
        default:
            output?.transferErrorSurname(text: "")
            return true
        }
    }
    
    private func checkTagName(tag: String) -> Bool {
        let text = tag.trimmingCharacters(in: .whitespaces)

        switch text {
        case let text where text.isEmpty:
            output?.transferErrorTagName(text: "Пустое поле")
            return false
        case let text where text.count < 6:
            output?.transferErrorTagName(text: "Минимум 6 символов")
            return false
        case let text where text.count > 25:
            output?.transferErrorTagName(text: "Максимум 25 символов")
            return false
        default:
            output?.transferErrorTagName(text: "")
            return true
        }
    }
    
    private func checkAboutMe(text: String) -> Bool {
        let text = text.condenseWhitespace()
        
        switch text {
        case let text where text.count > 400:
            output?.transferErrorAboutMe(text: "Максимум 400 символов")
            return false
        default:
            output?.transferErrorAboutMe(text: "")
            return true
        }
    }
    
    private func uploadImage(closure: @escaping () -> Void = { }) {

        let ref = Storage.storage().reference().child("avatars").child(defaultUser.identifier)
        let oldPath = getDocumentsDirectory().appendingPathComponent(avatar)
        let path = getDocumentsDirectory().appendingPathComponent(defaultUser.identifier)
        
        guard let imageData = try? Data(contentsOf: oldPath) else {
            return
        }
        
        try? imageData.write(to: path)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        ref.putData(imageData, metadata: metadata) { (metadata, error) in
            guard metadata != nil else {
                debugPrint("\(String(describing: error?.localizedDescription))!")
                return
            }
            
            ref.downloadURL { (url, error) in
                guard let url = url else {
                    debugPrint("\(String(describing: error?.localizedDescription))!")
                    return
                }
                defaultUser.avatarURL = url.absoluteString
                closure()
            }
        }
    }
    
    private func updateUser() {
        let db = Firestore.firestore()
        
        guard let user = user else { return }
        
        let updateData = {
            db.collection("users").document(user.uid).updateData([
                "name" : defaultUser.name,
                "surname" : defaultUser.surname,
                "tagname" : defaultUser.tagname,
                "aboutMe" : defaultUser.aboutMe,
                "avatarURL" : defaultUser.avatarURL,
            ]) {[weak self] error in
                if error != nil {
                    self?.output?.transferErrorName(text: "Ошибка обновления данных")
                } else {
                    debugPrint("Личные данные обновлены!")
                }
            }
        }
        
        uploadImage(closure: updateData)
        output?.openBackViewController()
    }
}

extension EditProfileInteractor: EditProfileInteractorInput {
    func giveAvatar(image: String) {
        avatar = image
        output?.transferAvatar(image: image)
    }
    
    func editAvatar() {
        output?.callAlertAvatar()
    }
    
    func verificationOfEnteredData() {
        
        if checkName(name: newName),
           checkSurname(surname: newSurname),
           checkTagName(tag: newTagname),
           checkAboutMe(text: newAboutMe) {
            
            defaultUser.name = newName
            defaultUser.surname = newSurname
            defaultUser.tagname = newTagname
            defaultUser.aboutMe = newAboutMe
            
            updateUser()
            //output?.openBackViewController()
        }
    }
    
    func newNameText(text: String) {
        newName = text
    }
    
    func newSurnameText(text: String) {
        newSurname = text
    }
    
    func newTagNameText(text: String) {
        newTagname = text
    }
    
    func newAboutMeText(text: String) {
        newAboutMe = text
    }
    
    func giveMyProfile() {
        output?.giveAwayMyProfile(profile: defaultUser)
    }
    
}
