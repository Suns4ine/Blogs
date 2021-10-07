//
//  SceneDelegate.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.07.2021.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let previewContainer = PreviewContainer.assemble(with: .init())
        let startContainer = StartContainer.assemble(with: .init())
        let tabBarController = TabBarController()
        var controller = previewContainer.viewController
        let theme = setupTheme(theme: ColorsApplication(rawValue: UserDefaults.standard.string(forKey: PersonalSetting.PersonalSettingsKeys.theme.rawValue) ?? "unspecified") ?? .unspecified)
        
        if !UserDefaults.standard.bool(forKey: "showPreview") {
            controller = previewContainer.viewController
        } else {
            if (Auth.auth().currentUser != nil) {
                controller = tabBarController
            } else {
                controller = startContainer.viewController
            }

        }
       
        setupSceneSetting()
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController:  controller)
        controller.navigationController?.setNavigationBarHidden(true, animated: false)
        window?.overrideUserInterfaceStyle = theme
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    private func setupSceneSetting() {
        let theme = ColorsApplication(rawValue: UserDefaults.standard.string(forKey: PersonalSetting.PersonalSettingsKeys.theme.rawValue) ?? "unspecified") ?? .unspecified
        self.window?.overrideUserInterfaceStyle = setupTheme(theme: theme)
    }
    
    func setupTheme(theme: ColorsApplication) -> UIUserInterfaceStyle {
        switch theme {
        case .dark : return .dark
        case .light : return .light
        default: return .unspecified
        }
    }
}
