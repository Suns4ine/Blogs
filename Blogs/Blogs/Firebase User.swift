//
//  Firebase User.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.09.2021.
//

import Foundation
import Firebase
import FirebaseStorage

final class UserManager {

 static func getDocument() {
    
        let currentUser = Auth.auth().currentUser
        let db = Firestore.firestore()
        
        guard let user = currentUser else { return }
        
        db.collection("users").document(user.uid).getDocument { [self] (snapshot, error) in

            if error != nil || snapshot == nil {
                debugPrint(error?.localizedDescription ?? "Ошибка получения данных" )
            } else {
                guard let snap = snapshot,
                      snap.exists,
                      let document = snap.data() else {
                    debugPrint("Данные отсутствуют")
                    return
                }
                
                self.setUser(document: document)

            }
        }
        
    }

   static func setUser(document: [String : Any ]) {
        
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
    defaultUser.avatarURL = document["avatarURL"] as? String ?? "ErrorAvatarURL"

    defaultUser.personalSetting.sound = personalSetting["sound"] as? Bool ?? true
    defaultUser.personalSetting.notification = personalSetting["notification"] as? Bool ?? true
    defaultUser.personalSetting.language = LanguagesApplication(rawValue: language) ?? .en
    defaultUser.personalSetting.theme = ColorsApplication(rawValue: theme) ?? .unspecified
        
    downloadAvatar()
    }
    
    static func downloadAvatar() {
        let ref = Storage.storage().reference(forURL: defaultUser.avatarURL)
        let path = getDocumentsDirectory().appendingPathComponent(defaultUser.identifier)
        let megaByte = Int64(5 * 1024 * 1024)
        
        ref.getData(maxSize: megaByte) { (data, error) in
            guard let imageData = data else {
                debugPrint("Ошибка получения данных")
                return
            }
            try? imageData.write(to: path)
        }
    }
}
