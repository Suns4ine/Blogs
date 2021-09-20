//
//  SettingRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import UIKit

final class SettingRouter {
    weak var sourceViewController: UIViewController?
}

extension SettingRouter: SettingRouterInput {
    
    func openChoiceLanguageViewController(with setting: Setting) {
        let container = ChoiceLanguageContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openChoiceColorViewController(with setting: Setting) {
        let container = ChoiceColorContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openPasswordChangeViewController(with setting: Setting) {
        let container = PasswordChangeContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openHelpViewController(with setting: Setting) {
        let container = HelpContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openAboutTheApplicationViewController(with setting: Setting) {
        let container = AboutTheApplicationContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openStartViewController() {
        let container = StartContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
