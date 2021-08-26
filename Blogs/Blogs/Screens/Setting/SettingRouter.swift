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
    func openChoiceViewController(with setting: Setting) {
        let container = ChoiceLanguageContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
