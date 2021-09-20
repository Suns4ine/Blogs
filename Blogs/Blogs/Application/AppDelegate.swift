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

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "Blogs")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
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
