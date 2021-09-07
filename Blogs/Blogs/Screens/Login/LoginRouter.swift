//
//  LoginRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import UIKit

final class LoginRouter {
    weak var sourceViewController: UIViewController?
}

extension LoginRouter: LoginRouterInput {
    func openTabBarViewController() {
        let tabBarController = TabBarController()
        self.sourceViewController?.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    func openSignUpViewController() {
        let container = SignUpContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
