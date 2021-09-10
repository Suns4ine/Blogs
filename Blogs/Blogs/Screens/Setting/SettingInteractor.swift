//
//  SettingInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import Foundation
import FirebaseAuth

final class SettingInteractor {
	weak var output: SettingInteractorOutput?
    
    private var settingArray: [Setting] = defaultSetting
    
    private func clearDefaultUser() {
        let user = User(dateCreate: .init(),
                        mail: "",
                        password: "",
                        identifier: "",
                        name: "",
                        surname: "",
                        tagname: "",
                        arrayBlogs: [],
                        arrayDrafts: [],
                        arrayLikedBlogs: [],
                        arrayFollowers: [],
                        arrayFolloving: [],
                        aboutMe: "",
                        avatar: .init(),
                        personalSetting: PersonalSetting(sound: false,
                                                         notification: false,
                                                         language: .eng,
                                                         theme: .standart,
                                                         cache: ""))
        defaultUser = user
    }
    
    private func logOut() {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          debugPrint("Error signing out: %@", signOutError)
        }
        clearDefaultUser()
        output?.openStart()
    }
}

extension SettingInteractor: SettingInteractorInput {
    func settingButtonCell(at indexPath: IndexPath) {
        
        
        let setting = settingArray[indexPath.row]

        guard setting.condition == .button else { return }
        
        switch setting.identifier {
        case "ClearCache": defaultUser.personalSetting.cache = "Clear Cache"
        case "LogOut": logOut()
        default: break
        }
    }
    
    func toggleButtonCell(_ cortage: (IndexPath, Bool)) {
        
        let index = cortage.0
        let flag = cortage.1
        
        let setting = settingArray[index.row]
        
        
        
        guard setting.condition == .toggle else { return }
        
        setting.flag = flag
        
        switch setting.identifier {
        case "Notification": defaultUser.personalSetting.notification = flag
        case "Sound": defaultUser.personalSetting.sound = flag
        default: break
        }
    }
    
    func getSetting(at indexPath: IndexPath) {
        let setting = settingArray[indexPath.row]
        playSound(name: .openController)
        
        guard setting.condition == .screen else { return }
        
        
        switch setting.identifier {
        case "Color": output?.openChoiceColor(setting)
        case "Language": output?.openChoiceLanguage(setting)
        case "Password": output?.openPasswordChange(setting)
        case "Help": output?.openHelp(setting)
        case "AboutTheApplication": output?.openAboutTheApplication(setting)
        default: break
        }
    }
    
    func fetchSettings() {
        output?.settingsDidRecieve(settingArray)
    }
    
}
