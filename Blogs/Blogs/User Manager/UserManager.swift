//
//  UserManager.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.09.2021.
//

import Foundation
import Firebase
import FirebaseStorage

final class UserManager {

 static func getDocument() {
    
    guard let user = Auth.auth().currentUser else { return }
    let db = Firestore.firestore()
        
    db.collection("users").document(user.uid).getDocument { [self] (snapshot, error) in
        if error != nil || snapshot == nil {
            debugPrint(error?.localizedDescription ?? "Ошибка получения данных")
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
    let language = personalSetting["language"] as? String ?? "ErrorLanguage"
    let theme = personalSetting["theme"] as? String ?? "ErrorTheme"
    
    defaultUser.name = document["name"] as? String ?? "ErrorName"
    defaultUser.surname = document["surname"] as? String ?? "ErrorSurname"
    defaultUser.tagname = document["tagname"] as? String ?? "ErrorTagname"
    defaultUser.mail = document["mail"] as? String ?? "ErrorMail"
    defaultUser.identifier = document["identifier"] as? String ?? "ErrorIdentifier"
    defaultUser.dateCreate = document["dateCreate"] as? Date ?? .init()
//    defaultUser.arrayBlogs = document["arrayBlogs"] as? Array ?? []
//    defaultUser.arrayDrafts = document["arrayDrafts"] as? Array ?? []
    defaultUser.aboutMe = document["aboutMe"] as? String ?? "ErrorAboutMe"
    defaultUser.avatarURL = document["avatarURL"] as? String ?? "ErrorAvatarURL"

    defaultUser.personalSetting.sound = personalSetting["sound"] as? Bool ?? true
    defaultUser.personalSetting.notification = personalSetting["notification"] as? Bool ?? true
    defaultUser.personalSetting.language = LanguagesApplication(rawValue: language) ?? .en
    defaultUser.personalSetting.theme = ColorsApplication(rawValue: theme) ?? .unspecified
        
    downloadAvatar()
    }
    
    static func downloadAvatar() {
        guard URL(string: defaultUser.avatarURL) != nil else { return }
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
    
    static func updateDataPersonalSettingUser() {
        guard let user = Auth.auth().currentUser else { return }
        let db = Firestore.firestore()
        var dicitionarySetting: [String: Any] = [:]

        dicitionarySetting["sound"] =
            UserDefaults.standard.bool(forKey: PersonalSetting.PersonalSettingsKeys.sound.rawValue)
        dicitionarySetting["notification"] =
            UserDefaults.standard.bool(forKey: PersonalSetting.PersonalSettingsKeys.notification.rawValue)
        dicitionarySetting["theme"] =
            UserDefaults.standard.string(forKey: PersonalSetting.PersonalSettingsKeys.theme.rawValue)
        dicitionarySetting["language"] =
            UserDefaults.standard.string(forKey: PersonalSetting.PersonalSettingsKeys.language.rawValue)
        
        
        
        db.collection("users").document(user.uid).updateData([
            "personalSetting" : dicitionarySetting,
        ]) { error in
            if error != nil {
                debugPrint("\(String(describing: error?.localizedDescription))!")
            } else {
                debugPrint("Данные Персональных настроек обновлены!")
            }

        }
    }
    
    static func addBlog(blog: Blog, nameArray: String) {
        guard let user = Auth.auth().currentUser else { return }
        let db = Firestore.firestore()
        
        var dataBlog: [String: Any] = [:]
        var finalPost: [String: Any] = [:]
        
        finalPost["date"] = blog.finalPost.date
        finalPost["title"] = blog.finalPost.title
        finalPost["text"] = blog.finalPost.text
        finalPost["arrayTags"] = blog.finalPost.arrayTags
        
        dataBlog["title"] = blog.title
        dataBlog["dateCreate"] = blog.dateCreate
        dataBlog["arrayTags"] = blog.arrayTags
        dataBlog["rating"] = blog.rating
        dataBlog["identifier"] = blog.identifier
        dataBlog["finalPost"] = finalPost
        
        
        db.collection("users").document(user.uid).updateData([
            nameArray : FieldValue.arrayUnion([dataBlog])
        ]) { error in
            if error != nil {
                debugPrint("\(String(describing: error?.localizedDescription))!")
            } else {
                debugPrint("Блог добавлен в базу данных!")
            }

        }
    }
    
    //Из-за того, что Firebase не пойми когда выполняет свой запрос
    static func getArrayBlogs(arrayName: String) -> [Blog] {
        var arrayBlog: [Blog] = []
        guard let user = Auth.auth().currentUser else { return arrayBlog }
        let db = Firestore.firestore()
        
        var dictionaryBlogs: [String : Any] = [:]
        
        db.collection("users").document(user.uid).getDocument { [self] (snapshot, error) in
            if error != nil {
                debugPrint(error?.localizedDescription ?? "Ошибка получения данных")
            } else {
                guard let snap = snapshot,
                      snap.exists,
                      let document = snap.data() else {
                    debugPrint("Данные отсутствуют")
                    return
                }
                guard let arrayDocument = document[arrayName] as? [String : Any] else { return }
                dictionaryBlogs = arrayDocument
                }
            }
        
        
        return arrayBlog
    }
    
//    private func parsingBlog(blogs: [String : Any]) -> [Blog] {
//        var arrayBlog: [Blog] = []
//
//        for blog in blogs {
//            var newBlog = Blog(user: defaultUser,
//                               title: blog["title"],
//                               dateCreate: <#T##Date#>,
//                               finalPost: <#T##Post#>,
//                               arrayTags: <#T##[String]#>,
//                               arrayLikeUsers: Set(),
//                               arrayShareUsers: Set(),
//                               rating: <#T##Int#>,
//                               identifier: <#T##String#>)
//        }
//
//
//        return arrayBlog
//    }
}
