//
//  AppDelegate.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.07.2021.
//

import UIKit
import CoreData
import Firebase
import ObjectiveC

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupAppDelegateSetting()
        
        NotificationCenter.default.addObserver(self, selector: #selector(languageWillChange),
                                               name: NSNotification.Name(rawValue: "LANGUAGE_WILL_CHANGE"),
                                               object: nil)

        let targetLang = UserDefaults.standard.object(forKey: "selectedLanguage") as? String
        Bundle.setLanguage((targetLang != nil) ? targetLang! : "en")

        return true
    }
}

extension AppDelegate {
    
    @objc
    private func languageWillChange(notification:NSNotification){
        let targetLang = notification.object as! String
        UserDefaults.standard.set(targetLang, forKey: "selectedLanguage")
        Bundle.setLanguage(targetLang)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LANGUAGE_DID_CHANGE"), object: targetLang)
    }
    
    private func setupAppDelegateSetting() {
        FirebaseApp.configure()
        User.createArrayAnotherUsers()
        UserManager.getDataUser()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LANGUAGE_WILL_CHANGE"),
                                        object: UserDefaults.standard.string(forKey: PersonalSetting.PersonalSettingsKeys.theme.rawValue))
    }
}
