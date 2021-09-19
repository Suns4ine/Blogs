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

    //MARK: Download
    //Скачиваем данные пользователя с бека, для дальнейшей установки
    static func getDataUser(closure: @escaping () -> Void = {}) {
    
    guard let user = Auth.auth().currentUser else { return }
    let db = Firestore.firestore()
        
    db.collection("users").document(user.uid).getDocument { [self] (snapshot, error) in
        if snapshot == nil || error != nil {
            debugPrint(error?.localizedDescription ?? "Ошибка получения данных!")
        } else {
            guard let snap = snapshot,
                  snap.exists,
                  let document = snap.data() else {
                debugPrint("Данные отсутствуют!")
                return
            }
            self.setUser(document: document)
            closure()
            }
        }
    }
    
    //Скачиваем наш аватар с бека
    static func downloadAvatar(closure: @escaping () -> Void = {}) {
        guard URL(string: defaultUser.avatarURL) != nil else { return }
        
        let ref = Storage.storage().reference(forURL: defaultUser.avatarURL)
        let path = getDocumentsDirectory().appendingPathComponent(defaultUser.identifier)
        let megaByte = Int64(5 * 1024 * 1024) //Максимальный размер изображения 5mB

        ref.getData(maxSize: megaByte) { (data, error) in
            guard let imageData = data else {
                debugPrint("Ошибка получения данных")
                return
            }
            try? imageData.write(to: path)
            closure()
        }
    }
    
    //Скачиваем наши блоги
    static func getArrayBlogs(document: [String : Any]) {
        guard Auth.auth().currentUser != nil else { return }
        guard let arrayDocument = document["arrayBlogs"] as? Array<Any> else { return }
        
        defaultUser.arrayBlogs = parsingBlog(blogs: arrayDocument).sorted{ $0.dateCreate > $1.dateCreate}
    }
    
    //Скачиваем наши черновики
    static func getArrayDraftBlogs(document: [String : Any]) {
        guard Auth.auth().currentUser != nil else { return }
        guard let arrayDocument = document["arrayDrafts"] as? Array<Any> else { return }
        
        defaultUser.arrayDrafts = parsingBlog(blogs: arrayDocument).sorted{ $0.dateCreate > $1.dateCreate}
    }
    
    //Скачиваем блоги, которые нам понравились
    static func getArrayLikedBlogs(document: [String : Any]) {
        guard Auth.auth().currentUser != nil else { return }
        guard let arrayDocument = document["arrayLikedBlogs"] as? Array<Any> else { return }
        
        defaultUser.arrayLikedBlogs = Set(parsingBlog(blogs: arrayDocument))
    }
    
    //MARK: Update
    //Обновляем наши данные настроек на беке
    static func updateDataPersonalSettingUser(closure: @escaping () -> Void = {}) {
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
                closure()
                debugPrint("Данные Персональных настроек обновлены!")
            }
        }
    }
    
    //Обновляем наши персональные данные на беке
    static func updatePersonalDataUser(closure: @escaping () -> Void = {}) {
        guard let user = Auth.auth().currentUser else { return }
        let db = Firestore.firestore()
        
        db.collection("users").document(user.uid).updateData([
            "name" : defaultUser.name,
            "surname" : defaultUser.surname,
            "tagname" : defaultUser.tagname,
            "aboutMe" : defaultUser.aboutMe,
            "avatarURL" : defaultUser.avatarURL,
        ]) { error in
            if error != nil {
                debugPrint("\(String(describing: error?.localizedDescription))!")
            } else {
                closure()
                debugPrint("Личные данные обновлены!")
            }
        }
    }
    
    //Обновляем наши блоги на бекенде
    static func updateBlogs(blogs: [Blog], nameArray: String, closure: @escaping () -> Void = {}) {
        guard let user = Auth.auth().currentUser else { return }
        let db = Firestore.firestore()
        
        var arrayBlogs: [Any] = []
        
        for blog in blogs {
            var dataBlog: [String: Any] = [:]
            var finalPost: [String: Any] = [:]
            
            finalPost["date"] = blog.finalPost.date
            finalPost["title"] = blog.finalPost.title
            finalPost["text"] = blog.finalPost.text
            finalPost["arrayTags"] = blog.finalPost.arrayTags
            
            dataBlog["nameUser"] = blog.nameUser
            dataBlog["title"] = blog.title
            dataBlog["dateCreate"] = blog.dateCreate
            dataBlog["arrayTags"] = blog.arrayTags
            dataBlog["rating"] = blog.rating
            dataBlog["identifier"] = blog.identifier
            dataBlog["finalPost"] = finalPost
            
            arrayBlogs.append(dataBlog)
        }
        
        db.collection("users").document(user.uid).updateData([
            nameArray : arrayBlogs
        ]) { error in
            if error != nil {
                debugPrint("\(String(describing: error?.localizedDescription))!")
            } else {
                debugPrint("Блоги \(nameArray) обновлены в базе данных!")
                closure()
            }
        }
    }
    
    //Обновляем фото на бекенде
    static func uploadImage(oldName: String, closure: @escaping () -> Void = {}) {

        let ref = Storage.storage().reference().child("avatars").child(defaultUser.identifier)
        let oldPath = getDocumentsDirectory().appendingPathComponent(oldName)
        let path = getDocumentsDirectory().appendingPathComponent(defaultUser.identifier)
        
        guard let imageData = try? Data(contentsOf: oldPath) else { return }
        try? imageData.write(to: path)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        //Отправляем фото на бекенд
        ref.putData(imageData, metadata: metadata) { (metadata, error) in
            guard metadata != nil else {
                debugPrint("\(String(describing: error?.localizedDescription))!")
                return
            }
            
            //Получаем url, где хранится наше фото
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
    
    //MARK: Add to Backend
    //Добавляем на бек наш блог
    static func addBlog(blog: Blog, nameArray: String, closure: @escaping () -> Void = {}) {
        guard let user = Auth.auth().currentUser else { return }
        let db = Firestore.firestore()
        
        var dataBlog: [String: Any] = [:]
        var finalPost: [String: Any] = [:]
        
        finalPost["date"] = blog.finalPost.date
        finalPost["title"] = blog.finalPost.title
        finalPost["text"] = blog.finalPost.text
        finalPost["arrayTags"] = blog.finalPost.arrayTags
        
        dataBlog["nameUser"] = blog.nameUser
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
                closure()
            }

        }
    }
    
    //MARK: Authorization, Register and Log Out
    //Регестрируем пользоватетя
    static func registerUser(user: User,
                             pass: String,
                             failClosure: @escaping (_ numbError: Int) -> Void = {_ in },
                             sucsessClosure: @escaping () -> Void = {}) {
        Auth.auth().createUser(withEmail: user.mail, password: pass) { (res, err) in
            if err != nil {
                debugPrint("\(String(describing: err?.localizedDescription))!")
                failClosure(1)
            } else {
                let db = Firestore.firestore()
                
                guard let result = res else {
                    debugPrint("\(String(describing: err?.localizedDescription))!")
                    failClosure(2)
                    return
                }
                //Здесь мы получаем уникальный индентификатор с бека, который присваиваем новому пользователю
                user.identifier =  String(result.user.uid)
                user.randomUserAvatar()
                
                db.collection("users").document(result.user.uid).setData([
                    "name" : user.name,
                    "surname" :  user.surname,
                    "tagname" :  user.tagname,
                    "mail" : user.mail,
                    "dateCreate" : Date.init(),
                    "identifier" : String(result.user.uid),
                    "arrayBlogs" :  user.arrayBlogs,
                    "arrayDrafts" : user.arrayDrafts,
                    "arrayLikedBlogs" : Array(user.arrayLikedBlogs),
                    "arrayFollowers" : Array(user.arrayFollowers),
                    "arrayFolloving" : Array(user.arrayFolloving),
                    "aboutMe" : user.aboutMe,
                    "avatarURL" : user.avatarURL,
                    "personalSetting" : [
                        "sound" : user.personalSetting.sound,
                        "notification" : user.personalSetting.notification,
                        "language" : user.personalSetting.language.rawValue,
                        "theme" : user.personalSetting.theme.rawValue
                    ],
                    "uid": result.user.uid
                ]) { (err) in
                    if err != nil {
                        debugPrint("\(String(describing: err?.localizedDescription))!")
                        failClosure(3)
                    }
                }
                
                defaultUser = user
                uploadImage(oldName: defaultUser.identifier,
                            closure: {
                                updatePersonalDataUser()
                            })
                sucsessClosure()
            }
        }
        
    }
    
    //Авторизируем пользователя
    static func authUser(mail: String,
                         pass: String,
                         failClosure: @escaping (_ numbError: Int) -> Void = {_ in },
                         sucsessClosure: @escaping () -> Void = {}) {
            
        Auth.auth().signIn(withEmail: mail, password: pass) {(result, error) in
            
            if error != nil {
                failClosure(1)
            } else {
                let db = Firestore.firestore()
                
                guard let res = result else {
                    failClosure(2)
                    return
                }
                
                db.collection("users").document(res.user.uid).getDocument { (snapshot, error) in
                    if error != nil || snapshot == nil {
                        failClosure(3)
                    } else {
                        guard let snap = snapshot,
                              snap.exists,
                              let document = snap.data() else {
                            failClosure(4)
                            return
                        }
                        setUser(document: document)
                        sucsessClosure()
                    }
                }
            }
        }
    }
    
    //Выход пользователя
    static func logOut(closure: @escaping () -> Void = {}) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          debugPrint("Error signing out: %@", signOutError)
        }
    }
    
    //Обновление пароля
    static func updatePassword(pass: String ,
                                failClosure: @escaping () -> Void = {},
                                sucsessClosure: @escaping () -> Void = {}) {
        guard let user = Auth.auth().currentUser else { return }
        
        user.updatePassword(to: pass) {(error) in
            if error != nil {
                failClosure()
            } else {
                sucsessClosure()
            }
        }
    }
    
    //Повторный вход пользователя
    static func resetSignIn(pass: String ,
                            failClosure: @escaping () -> Void = {},
                            sucsessClosure: @escaping () -> Void = {}) {
        
        Auth.auth().signIn(withEmail: defaultUser.mail, password: pass) { (result, error) in
            if error != nil {
                failClosure()
            } else {
                sucsessClosure()
            }
        }
    }

    //MARK: Setup
    //Устанавливаем скачанные даные в нашего user'a
    static func setUser(document: [String : Any ]) {
        let personalSetting = document["personalSetting"] as? Dictionary<String, Any> ?? [:]
        let language = personalSetting["language"] as? String ?? "ErrorLanguage"
        let theme = personalSetting["theme"] as? String ?? "ErrorTheme"
        let date = document["dateCreate"] as? Timestamp ?? .init()
        
        defaultUser.name = document["name"] as? String ?? "ErrorName"
        defaultUser.surname = document["surname"] as? String ?? "ErrorSurname"
        defaultUser.tagname = document["tagname"] as? String ?? "ErrorTagname"
        defaultUser.mail = document["mail"] as? String ?? "ErrorMail"
        defaultUser.identifier = document["identifier"] as? String ?? "ErrorIdentifier"
        defaultUser.aboutMe = document["aboutMe"] as? String ?? "ErrorAboutMe"
        defaultUser.avatarURL = document["avatarURL"] as? String ?? "ErrorAvatarURL"
        defaultUser.dateCreate = date.dateValue()

        defaultUser.personalSetting.sound = personalSetting["sound"] as? Bool ?? true
        defaultUser.personalSetting.notification = personalSetting["notification"] as? Bool ?? true
        defaultUser.personalSetting.language = LanguagesApplication(rawValue: language) ?? .en
        defaultUser.personalSetting.theme = ColorsApplication(rawValue: theme) ?? .unspecified
            
        getArrayBlogs(document: document)
        getArrayDraftBlogs(document: document)
        getArrayLikedBlogs(document: document)
        downloadAvatar()
    }
    
    //MARK: Parsing
    //Парсим с бекенда массив различных блогов
    private static func parsingBlog(blogs: [Any]) -> [Blog] {
        var arrayBlog: [Blog] = []
        
        //Проходимя по массиву с бека, если не смогли что-то считай в одном блоге, то пропускаем этот блог
        for blog in blogs {
            guard let blog = blog as? [String : Any] else { continue }
            guard let title = blog["title"] as? String else { continue }
            guard let dateCreate = blog["dateCreate"] as? Timestamp else { continue }
            guard let arrayTags = blog["arrayTags"] as? [String] else { continue }
            guard let rating = blog["rating"] as? Int else { continue }
            guard let identifier = blog["identifier"] as? String else { continue }
            guard let nameUser = blog["nameUser"] as? String else { continue }
            guard let post = blog["finalPost"] as? [String : Any] else { continue }
            
            guard let datePost = post["date"] as? Timestamp else { continue }
            guard let titlePost = post["title"] as? String else { continue }
            guard let textPost = post["text"] as? String else { continue }
            guard let arrayTagsPost = post["arrayTags"] as? [String] else { continue }
            
            let newBlog = Blog(user: defaultUser,
                            title: title,
                            dateCreate: dateCreate.dateValue(),
                            finalPost: Post(date: datePost.dateValue(),
                                            title: titlePost,
                                            text: textPost,
                                            arrayTags: arrayTagsPost),
                            arrayTags: arrayTags,
                            arrayLikeUsers: Set(),
                            arrayShareUsers: Set(),
                            rating: rating,
                            identifier: identifier)
            newBlog.nameUser = nameUser
            arrayBlog.append(newBlog)
        }
        return arrayBlog
    }
}
